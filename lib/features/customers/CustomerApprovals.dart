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
            ? Container()
            : buildCustomerDetail(controller);
      },
    ));
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
                return Column(
                  children: [
                    Row(
                      children: [
                        Checkbox(
                          value: false,
                          onChanged: (bool? newValue) {
                            // you probably want to manage selection here
                          },
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              controller.customerModel!.data![index].name
                                  .toString(),
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                fontFamily: 'JosefinSans',
                              ),
                            ),
                            const SizedBox(height: 10),
                            Text(
                              controller.customerModel!.data![index].mobile
                                  .toString(),
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
                _optionButton('Approved'),
                _optionButton('Reject'),
              ],
            ),
          ],
        ),
      ),
    );
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
