import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tn_jewellery_admin/features/dashboard/controller/dashboard_controller.dart';
import 'package:tn_jewellery_admin/features/my_order/controller/order_controller.dart';
import 'package:tn_jewellery_admin/features/my_order/model/InProgressOrderListModel.dart';
import 'package:tn_jewellery_admin/features/my_order/widgets/StepIndicator.dart';
import 'package:tn_jewellery_admin/utils/colors.dart';
import 'package:url_launcher/url_launcher.dart';

class OrderStatusPage extends StatefulWidget {
  const OrderStatusPage({super.key});

  @override
  State<OrderStatusPage> createState() => _OrderStatusPageState();
}

class _OrderStatusPageState extends State<OrderStatusPage> {
  int selectedIndex = 0; // Default selected button

  List<String> labels = ['CANCEL ORDER', 'COMPLETE STATUS'];
  List<Color> borderColors = [brandGoldColor, brandGoldColor];

  final List<String> workStatusList = [
    'In Progress',
    'Delivery Ready',
    'Delivered'
  ];

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OrderController>(builder: (controller) {
      return buildOrderDetails(controller);
    });
  }

  Widget buildOrderDetails(OrderController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(right: 5),
                child: customDropdown(
                    label: 'Work Status',
                    labelStyle: const TextStyle(
                      fontFamily: 'JosefinSans',
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: brandGreyColor,
                    ),
                    selectedValue: controller.selectedWorkStatus,
                    items: workStatusList,
                    onChanged: (value) {
                      controller.selectedWorkStatus = value ?? "";
                      controller.update();

                      controller.filterBody = {
                        "id_supplier": "",
                        "id_customer": "",
                        "date": "",
                      };

                      controller.selectedVendor = null;
                      controller.selectedDate = null;

                      if (controller.selectedWorkStatus == "In Progress") {
                        controller.selectedWorkStatusID = "inprogress";
                        controller.currentStep = 2;
                        controller.getOrderStatusList(
                            "inprogress", controller.filterBody);
                      } else if (controller.selectedWorkStatus ==
                          "Delivery Ready") {
                        controller.selectedWorkStatusID = "delivery_ready";

                        controller.currentStep = 3;

                        controller.getOrderStatusList(
                            "delivery_ready", controller.filterBody);
                        Get.find<DashboardController>().getCustomerList("2");
                      } else if (controller.selectedWorkStatus == "Delivered") {
                        controller.selectedWorkStatusID = "delivered";
                        controller.currentStep = 4;
                        controller.getOrderStatusList(
                            "delivered", controller.filterBody);
                        Get.find<DashboardController>().getCustomerList("2");
                      }
                    }),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(right: 5),
                child: controller.selectedWorkStatus == "In Progress"
                    ? customDropdown(
                        label: 'Vendor Wise',
                        labelStyle: const TextStyle(
                          fontFamily: 'JosefinSans',
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: brandGreyColor,
                        ),
                        selectedValue: controller.selectedVendor,
                        items: controller.supplierListModel!.data!
                            .map((e) => e.supplierName ?? '')
                            .toList(),
                        onChanged: (value) {
                          controller.selectedVendor = value;
                          var supplierID = controller.supplierListModel!.data!
                              .firstWhere((e) => e.supplierName == value)
                              .idSupplier;
                          controller.filterBody = {
                            "id_supplier": supplierID,
                            "id_customer": "",
                            "date": controller.formatDateToYMD(),
                          };

                          controller.getOrderStatusList(
                              controller.selectedWorkStatusID,
                              controller.filterBody);
                        })
                    : customDropdown(
                        label: 'Customer Wise',
                        labelStyle: const TextStyle(
                          fontFamily: 'JosefinSans',
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: brandGreyColor,
                        ),
                        selectedValue: controller.selectedVendor,
                        items: Get.find<DashboardController>()
                            .customerModel!
                            .data!
                            .map((e) => e.name ?? '')
                            .toList(),
                        onChanged: (value) {
                          controller.selectedVendor = value;

                          var customerID = Get.find<DashboardController>()
                              .customerModel!
                              .data!
                              .firstWhere((e) => e.name == value)
                              .idCustomer;
                          controller.filterBody = {
                            "id_supplier": "",
                            "id_customer": customerID,
                            "date": controller.formatDateToYMD(),
                          };
                          controller.getOrderStatusList(
                              controller.selectedWorkStatusID,
                              controller.filterBody);
                        },
                      ),
              ),
            ),
            Container(
              height: 50,
              padding: const EdgeInsets.symmetric(horizontal: 12),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(15),
              ),
              alignment: Alignment.center,
              child: GestureDetector(
                onTap: () {
                  controller.pickDate(controller);
                },
                child: Text(
                  controller.selectedDate == null
                      ? "Delivery Date"
                      : controller.formatDateToYMD(),
                  style: const TextStyle(
                    fontFamily: 'JosefinSans',
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    color: brandGreyColor,
                  ),
                ),
              ),
            ),
          ],
        ),
        Expanded(
          child: ListView.separated(
            itemCount: controller.inProgressOrderListModel?.data?.length ?? 0,
            separatorBuilder: (c, _) => const SizedBox(height: 12),
            itemBuilder: (context, index) {
              return orderDetailsStatus(controller,
                  controller.inProgressOrderListModel?.data![index]);
            },
          ),
        )
      ],
    );
  }

  Widget orderDetailsStatus(
      OrderController controller, InProgressOrderData? inProgressOrderData) {
    return Padding(
      padding: const EdgeInsets.only(top: 12, bottom: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: EdgeInsets.all(2), // Space between avatar and border
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: white8, width: 1),
                ),
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 24,
                  child: Icon(Icons.shopping_cart, color: Colors.black),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text("${inProgressOrderData?.customerName ?? ''} - ",
                            style: const TextStyle(
                                fontFamily: 'JosefinSans',
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: textColor)),
                        const SizedBox(width: 5),
                        GestureDetector(
                          onTap: () {
                            final phone =
                                inProgressOrderData?.customerMobile ?? '';
                            if (phone.isNotEmpty) {
                              launchUrl(Uri.parse("tel:$phone"));
                            }
                          },
                          child: Text(
                            inProgressOrderData?.customerMobile ?? '',
                            style: const TextStyle(
                              fontFamily: 'JosefinSans',
                              fontSize: 14,
                              color: Colors.blue,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          inProgressOrderData?.productName ?? '',
                          style: TextStyle(
                              fontFamily: 'JosefinSans',
                              fontWeight: FontWeight.w500,
                              color: brandGreyColor),
                        ),
                        Text(
                            "${inProgressOrderData?.grossWt.toString()}" + ' g',
                            style: TextStyle(
                                fontFamily: 'JosefinSans',
                                fontWeight: FontWeight.w500,
                                color: brandGreyColor)),
                        Text(inProgressOrderData?.customerDueDate ?? '',
                            style: TextStyle(
                                fontFamily: 'JosefinSans',
                                fontWeight: FontWeight.w500,
                                color: brandGreyColor)),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.grey[100],
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// Customer Info (Left Aligned)
                Expanded(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Icon(Icons.person, size: 18, color: Colors.black54),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "${inProgressOrderData?.supplierName ?? ''} - ",
                              style: const TextStyle(
                                fontFamily: 'JosefinSans',
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                color: Colors.black87,
                              ),
                            ),
                            const SizedBox(width: 5),
                            GestureDetector(
                              onTap: () {
                                final phone =
                                    inProgressOrderData?.supplierMobile ?? '';
                                if (phone.isNotEmpty) {
                                  launchUrl(Uri.parse("tel:$phone"));
                                }
                              },
                              child: Text(
                                inProgressOrderData?.supplierMobile ?? '',
                                style: const TextStyle(
                                  fontFamily: 'JosefinSans',
                                  fontSize: 14,
                                  color: Colors.blue,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: StepIndicator(currentStep: controller.currentStep),
          ),
          const SizedBox(height: 10),
          inProgressOrderData?.orderStatus == 4
              ? Center(
                  child: InkWell(
                    onTap: () async {
                      await Get.find<OrderController>()
                          .OrderCompleteStatus(body: {
                        "detail_id": "${inProgressOrderData?.detailId ?? 0}",
                        "added_through": 2,
                        "id_job_order_detail":
                            "${inProgressOrderData?.idJobOrderDetail ?? 0}",
                        "status": 5 // 4 = Complete, 5 = Delivered
                      });

                      await Get.find<OrderController>().getOrderStatusList(
                          Get.find<OrderController>().selectedWorkStatus,
                          controller.filterBody);
                    },
                    child: Container(
                        width: 130,
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 12),
                        decoration: BoxDecoration(
                          color: brandGoldColor,
                          border: Border.all(color: brandGoldColor, width: 1.5),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Row(
                          children: [
                            Text(
                              "DELIVER NOW",
                              style: TextStyle(
                                fontFamily: 'JosefinSans',
                                fontWeight: FontWeight.w500,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        )),
                  ),
                )
              : inProgressOrderData?.orderStatus == 3
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: List.generate(labels.length, (index) {
                        return GestureDetector(
                          onTap: () async {
                            setState(() {
                              selectedIndex = index;
                            });

                            if (selectedIndex == 0) {
                              // Cancel Order Logic
                              await Get.find<OrderController>()
                                  .OrderCancelStatus(body: {
                                "cancel_reason": "Any",
                                "detail_id":
                                    "${inProgressOrderData?.detailId ?? 0}",
                                "id_job_order_detail":
                                    "${inProgressOrderData?.idJobOrderDetail ?? 0}",
                                "status": 6
                              });
                            } else {
                              // Complete Status Logic
                              Get.find<OrderController>()
                                  .OrderCompleteStatus(body: {
                                "detail_id":
                                    "${inProgressOrderData?.detailId ?? 0}",
                                "added_through": 2,
                                "id_job_order_detail":
                                    "${inProgressOrderData?.idJobOrderDetail ?? 0}",
                                "status": 4 // 4 = Complete, 5 = Delivered
                              });
                            }
                            await Get.find<OrderController>()
                                .getOrderStatusList(
                                    Get.find<OrderController>()
                                        .selectedWorkStatus,
                                    controller.filterBody);
                          },
                          child: actionButton(
                            labels[index],
                            borderColors[index],
                            isSelected: selectedIndex == index,
                          ),
                        );
                      }),
                    )
                  : SizedBox.shrink(),
          SizedBox(height: 10),
          Divider(thickness: 1, color: Colors.grey[300]),
        ],
      ),
    );
  }

  Widget actionButton(String label, Color borderColor,
      {required bool isSelected}) {
    return Container(
        margin: const EdgeInsets.only(right: 8),
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
        decoration: BoxDecoration(
          color: isSelected ? borderColor : Colors.white,
          border: Border.all(color: borderColor, width: 1.5),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            Text(
              label,
              style: TextStyle(
                fontFamily: 'JosefinSans',
                fontWeight: FontWeight.w500,
                color: isSelected ? Colors.white : borderColor,
              ),
            ),
          ],
        ));
  }
}

Widget customDropdown({
  required String label,
  required TextStyle labelStyle,
  required String? selectedValue,
  required List<String> items,
  required Function(String?) onChanged,
}) {
  return Container(
    height: 50,
    decoration: BoxDecoration(
      border: Border.all(color: Colors.grey),
      borderRadius: BorderRadius.circular(15),
    ),
    child: DropdownButtonHideUnderline(
      child: DropdownButton2<String>(
        isExpanded: true,
        value: selectedValue,
        hint: Row(
          children: [
            Text(
              label,
              style: labelStyle,
            ),
          ],
        ),
        items: items.map((value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                value,
                style: labelStyle,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          );
        }).toList(),
        onChanged: onChanged,
        iconStyleData: const IconStyleData(
          icon: Icon(Icons.arrow_drop_down, color: Colors.grey),
        ),
        dropdownStyleData: DropdownStyleData(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.white,
          ),
        ),
        menuItemStyleData: const MenuItemStyleData(
          padding: EdgeInsets.symmetric(horizontal: 6),
        ),
      ),
    ),
  );
}
