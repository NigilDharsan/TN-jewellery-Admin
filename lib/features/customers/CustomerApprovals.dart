import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tn_jewellery_admin/features/dashboard/controller/dashboard_controller.dart';
import 'package:tn_jewellery_admin/utils/colors.dart';
import 'package:url_launcher/url_launcher.dart';

class CustomerNameList extends StatefulWidget {
  const CustomerNameList({super.key});

  @override
  State<CustomerNameList> createState() => _CustomerNameListState();
}

class _CustomerNameListState extends State<CustomerNameList>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final List<String> _tabs = ['Yet to Approve', 'Rejected', 'Total Approved'];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: _tabs.length, vsync: this);
    _tabController.addListener(_handleTabChange);
    Get.find<DashboardController>().getCustomerList("1"); // Default first tab
  }

  void _handleTabChange() {
    if (_tabController.indexIsChanging) return;

    final status = _getStatusByTabIndex(_tabController.index);
    Get.find<DashboardController>().getCustomerList(status.toString());
  }

  int _getStatusByTabIndex(int index) {
    switch (index) {
      case 0:
        return 1; // Yet to Approve
      case 1:
        return 3; // Rejected
      case 2:
        return 2; // Approved
      default:
        return 1;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: brandGoldLightColor.withAlpha(80),
      appBar: AppBar(
        title: const Text('Customer Approval'),
        backgroundColor: brandGoldColor,
        bottom: TabBar(
          controller: _tabController,
          tabs: _tabs.map((label) => Tab(text: label)).toList(),
          labelColor: Colors.black,
          indicatorColor: Colors.black,
        ),
      ),
      body: GetBuilder<DashboardController>(
        autoRemove: false,
        builder: (controller) {
          if (controller.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          return TabBarView(
            controller: _tabController,
            children: [
              _buildCustomerList(controller, statusFilter: 1), // Yet to Approve
              _buildCustomerList(controller, statusFilter: 3), // Rejected
              _buildCustomerList(controller, statusFilter: 2), // Approved
            ],
          );
        },
      ),
    );
  }

  Widget _buildCustomerList(DashboardController controller,
      {required int statusFilter}) {
    final customerList = controller.customerModel?.data ?? [];

    final isApprovalTab = statusFilter == 1;

    return Padding(
      padding: const EdgeInsets.all(20),
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: customerList.length,
              itemBuilder: (context, index) {
                final customer = customerList[index];
                return GestureDetector(
                  onTap: () {
                    final phone =
                        customer.mobile ?? '';
                    if (phone.isNotEmpty) {
                      launchUrl(Uri.parse("tel:$phone"));
                    }
                  },
                  child:Card(
                  margin: const EdgeInsets.symmetric(vertical: 8),
                  elevation: 3,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 12, horizontal: 16),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if (isApprovalTab)
                          Padding(
                            padding: const EdgeInsets.only(right: 12),
                            child: Checkbox(
                              value:
                                  controller.selectedCustomers[customer.pkId] ??
                                      false,
                              onChanged: (bool? newValue) {
                                setState(() {
                                  controller.selectedCustomers[customer.pkId!] =
                                      newValue!;
                                });
                              },
                            ),
                          ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    customer.name ?? 'No Name',
                                    style: const TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 18,
                                      fontFamily: 'JosefinSans',
                                    ),
                                  ),
                                  SizedBox(width: 2),
                                  Text(
                                    ' - ${customer.companyName ?? ''}',
                                    style: const TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 18,
                                      fontFamily: 'JosefinSans',
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 4),
                              Text(
                                customer.mobile ?? 'No Mobile',
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontFamily: 'JosefinSans',
                                  color: Colors.black54,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                customer.gstNumber ?? '',
                                style: const TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 15,
                                  fontFamily: 'JosefinSans',
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),);
              },
            ),
            if (isApprovalTab) const SizedBox(height: 20),
            if (isApprovalTab)
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  InkWell(
                    onTap: () {
                      _submitCustomerStatus(controller, 2); // Approved
                    },
                    child: _optionButton('Approve'),
                  ),
                  InkWell(
                    onTap: () {
                      _submitCustomerStatus(controller, 3); // Reject
                    },
                    child: _optionButton('Reject'),
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }

  void _submitCustomerStatus(DashboardController controller, int status) {
    final List<Map<String, dynamic>> selectedIds = controller
        .selectedCustomers.entries
        .where((entry) => entry.value == true)
        .map((entry) => {"pk_id": entry.key})
        .toList();

    if (selectedIds.isEmpty) {
      Get.snackbar("No Selection", "Please select at least one customer.");
      return;
    }

    controller.postCustomerStatus({
      "approved_through": 2,
      "approved_status": status,
      "approve_ids": selectedIds,
    }).then((_) {
      final currentStatus = _getStatusByTabIndex(_tabController.index);
      controller.getCustomerList(currentStatus.toString()); // Refresh list
      controller.selectedCustomers.clear(); // Clear selections
    });
  }

  Widget _optionButton(String text) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      decoration: BoxDecoration(
        color: brandGoldColor,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 6,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Text(
        text,
        style: const TextStyle(
          fontFamily: 'JosefinSans',
          fontWeight: FontWeight.bold,
          color: Colors.black,
          fontSize: 16,
        ),
      ),
    );
  }
}


// Future<void> callNumber(String phoneNumber) async {
//   final Uri phoneUri = Uri(scheme: mobile, path: phoneNumber);
//   if (await canLaunchUrl(phoneUri)) {
//     await launchUrl(phoneUri);
//   } else {
//     throw 'Could not launch $phoneNumber';
//   }
// }