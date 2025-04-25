import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tn_jewellery_admin/features/dashboard/controller/dashboard_controller.dart';
import 'package:tn_jewellery_admin/utils/colors.dart';

class CustomerNameList extends StatefulWidget {
  const CustomerNameList({super.key});

  @override
  State<CustomerNameList> createState() => _CustomerNameListState();
}

class _CustomerNameListState extends State<CustomerNameList> {


  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<DashboardController>(
        initState: (state) => Get.find<DashboardController>().getCustomerList(),
        autoRemove: false,
        builder: (controller) {
          return controller.isLoading
              ? const Center(child: CircularProgressIndicator())
              : buildCustomerDetail(controller);
        },
      ),
    );
  }

  Widget buildCustomerDetail(DashboardController controller) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 50),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: controller.customerModel?.data?.length ?? 0,
              itemBuilder: (context, index) {
                final customer = controller.customerModel!.data![index];
                return Column(
                  children: [
                    Row(
                      children: [
                        Checkbox(
                          value: controller.selectedCustomers[customer.pkId] ?? false,
                          onChanged: (bool? newValue) {
                            setState(() {
                              controller.selectedCustomers[customer.pkId!] = newValue!;
                            });
                          },
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              customer.name ?? '',
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                fontFamily: 'JosefinSans',
                              ),
                            ),
                            const SizedBox(height: 10),
                            Text(
                              customer.mobile ?? '',
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                fontFamily: 'JosefinSans',
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const Divider(color: Colors.black),
                  ],
                );
              },
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                InkWell(
                  onTap: () {
                    _submitCustomerStatus(controller, 2); 
                  },
                  child: _optionButton('Approved'),
                ),
                InkWell(
                  onTap: () {
                    _submitCustomerStatus(controller, 3); 
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
    final List<Map<String, dynamic>> selectedIds = controller.selectedCustomers.entries
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
