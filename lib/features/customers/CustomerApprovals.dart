import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
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
  String isSelectButton = 'LifeTime';
  DateTime? selectedDateTime; // Define the selectedDateTime variable
  bool isEditMode = false;
  late TabController _tabController;
  final List<String> _tabs = ['Yet to Approve', 'Rejected', 'Total Approved'];
  bool showApproveBtnInThirdTab = false;

  Future<void> pickDateTime() async {
    final date = await showDatePicker(
      context: context,
      initialDate: selectedDateTime ?? DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2100),
    );

    if (date != null) {
      final time = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.fromDateTime(selectedDateTime ?? DateTime.now()),
      );

      if (time != null) {
        setState(() {
          // Update the selected date and time
          selectedDateTime =
              DateTime(date.year, date.month, date.day, time.hour, time.minute);
        });
      }
    }
  }

  Widget buildSelectedDateTime() {
    return selectedDateTime == null
        ? const SizedBox.shrink() // Hide if no date is selected
        : Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              'Selected: ${DateFormat('yyyy-MM-dd HH:mm').format(selectedDateTime!)}',
              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
            ),
          );
  }

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
    final isSelectButton = statusFilter == 1;
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
                    final phone = customer.mobile ?? '';
                    if (phone.isNotEmpty) {
                      launchUrl(Uri.parse("tel:$phone"));
                    }
                  },
                  child: Card(
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
                                value: controller
                                        .selectedCustomers[customer.pkId] ??
                                    false,
                                onChanged: (bool? newValue) {
                                  setState(() {
                                    controller
                                            .selectedCustomers[customer.pkId!] =
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
                                const SizedBox(height: 10),
                                Text(
                                  'Catalogue Field',
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 15,
                                    fontFamily: 'JosefinSans',
                                  ),
                                ),
                                const SizedBox(height: 1),
                                if (isSelectButton) buildFirstTab(),
                                if (statusFilter == 3) buildSecondTab(),
                                if (statusFilter == 2) buildThirdTab(),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
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

  Widget buildFirstTab() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Flexible(
              flex: 1,
              child: RadioListTile<String>(
                contentPadding: EdgeInsets.zero,
                title: const Text(
                  'LifeTime',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 15,
                    fontFamily: 'JosefinSans',
                  ),
                ),
                value: 'LifeTime',
                groupValue: isSelectButton,
                onChanged: (value) {
                  setState(() {
                    isSelectButton = value!;
                  });
                },
              ),
            ),
            const SizedBox(width: 1),
            Flexible(
              flex: 1,
              child: RadioListTile<String>(
                contentPadding: EdgeInsets.zero,
                title: const Text(
                  'Limited',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 15,
                    fontFamily: 'JosefinSans',
                  ),
                ),
                value: 'Limited',
                groupValue: isSelectButton,
                onChanged: (value) async {
                  setState(() {
                    isSelectButton = value!;
                  });
                  await pickDateTime();
                },
              ),
            ),
          ],
        ),
        if (isSelectButton == 'Limited' && selectedDateTime != null)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              'Selected: ${DateFormat('yyyy-MM-dd HH:mm').format(selectedDateTime!)}',
              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
            ),
          ),
        const SizedBox(height: 10),
        ElevatedButton(
          onPressed: () {},
          child: const Text('Approve'),
        ),
      ],
    );
  }

  Widget buildSecondTab() {
    return Padding(
      padding: const EdgeInsets.only(right: 80),
      child: Stack(
        children: [
          Column(
            children: [
              const SizedBox(height: 40),
              // Add spacing below the icon if needed
              if (isEditMode)
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      isEditMode = false;
                    });
                  },
                  child: const Text('Approve'),
                ),
            ],
          ),
          TextButton(
              onPressed: () {
                setState(() {
                  isEditMode = true;
                });
              },
              child: Text(
                'Edit',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 15,
                  fontFamily: 'JosefinSans',
                ),
              ))
        ],
      ),
    );
  }

  Widget buildThirdTab() {
    return Column(
      children: [
        Align(
            alignment: Alignment.topRight,
            child: TextButton(
                onPressed: () {
                  setState(() {
                    showApproveBtnInThirdTab = true;
                  });
                },
                child: Text(
                  'Reject',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 15,
                    fontFamily: 'JosefinSans',
                  ),
                ))),
        if (showApproveBtnInThirdTab)
          ElevatedButton(
            onPressed: () {
              setState(() {
                showApproveBtnInThirdTab = false;
              });
            },
            child: const Text('Approve Again'),
          ),
      ],
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
