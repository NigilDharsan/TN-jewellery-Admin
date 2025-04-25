import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tn_jewellery_admin/features/my_order/controller/order_controller.dart';
import 'package:tn_jewellery_admin/features/my_order/model/InProgressOrderListModel.dart';
import 'package:tn_jewellery_admin/features/my_order/widgets/StepIndicator.dart';
import 'package:tn_jewellery_admin/features/my_order/widgets/myOrderWidgets.dart';
import 'package:tn_jewellery_admin/utils/colors.dart';
import 'package:tn_jewellery_admin/utils/widgets/custom_app_bar.dart';

class myOrderScreen extends StatefulWidget {
  const myOrderScreen({super.key});

  @override
  State<myOrderScreen> createState() => _myOrderScreenState();
}

class _myOrderScreenState extends State<myOrderScreen> {
  bool isNewOrdersSelected = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(50),
          child: CustomAppBar(
            title: 'CUSTOM ORDERS',
            isBackButtonExist: false,
          )),
      body: GetBuilder<OrderController>(
          initState: (state) => Get.find<OrderController>().getNewOrderList(),
          builder: (controller) {
            return buildOrderList(controller);
          }),
    );
  }
}

Widget buildOrderList(OrderController controller) {
  return Padding(
    padding: const EdgeInsets.all(20),
    child: Column(
      children: [
        Row(
          children: [
            Expanded(
              child: buildTabButton(
                  "NEW ORDERS", controller.isNewOrdersSelected, () {
                controller.isNewOrdersSelected = true;
                Get.find<OrderController>().getNewOrderList();
              }),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: buildTabButton(
                  "ORDER STATUS", !controller.isNewOrdersSelected, () {
                controller.isNewOrdersSelected = false;
                Get.find<OrderController>()
                    .getOrderStatusList("inprogress"); //delivery_ready
              }),
            ),
          ],
        ),
        const SizedBox(height: 20),
        controller.isLoading
            ? Container()
            : Expanded(
                child: controller.isNewOrdersSelected
                    ? ListView.separated(
                        itemCount:
                            controller.openOrderListModel?.data?.length ?? 0,
                        separatorBuilder: (_, __) => const SizedBox(height: 12),
                        itemBuilder: (context, index) {
                          var orderListData =
                              controller.openOrderListModel?.data?[index];
                          return buildOrderCard(controller, orderListData);
                        },
                      )
                    : OrderStatusPage(),
              ),
      ],
    ),
  );
}

class OrderStatusPage extends StatefulWidget {
  const OrderStatusPage({super.key});

  @override
  State<OrderStatusPage> createState() => _OrderStatusPageState();
}

class _OrderStatusPageState extends State<OrderStatusPage> {
  int selectedIndex = 0; // Default selected button

  List<String> labels = ['CANCEL ORDER', 'COMPLETE STATUS'];
  List<Color> borderColors = [brandGoldColor, brandGoldColor];

  String? selectedVendor;

  DateTime? selectedDate;

  final List<String> workStatusList = [
    'inprogress',
    'delivery_ready',
    'delivered'
  ];
  final List<String> vendorList = ['Vendor 1', 'Vendor 2', 'Vendor 3'];

  Future<void> _pickDate() async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate ?? DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2100),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

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

                      if (controller.selectedWorkStatus == "inprogress") {
                        controller.currentStep = 2;
                        controller.getOrderStatusList("inprogress");
                      } else if (controller.selectedWorkStatus ==
                          "delivery_ready") {
                        controller.currentStep = 3;

                        controller.getOrderStatusList("delivery_ready");
                      } else if (controller.selectedWorkStatus == "delivered") {
                        controller.currentStep = 4;
                        controller.getOrderStatusList("delivered");
                      }
                    }),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(right: 5),
                child: customDropdown(
                  label: 'Vendor Wise',
                  labelStyle: const TextStyle(
                    fontFamily: 'JosefinSans',
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: brandGreyColor,
                  ),
                  selectedValue: selectedVendor,
                  items: vendorList,
                  onChanged: (value) => setState(() => selectedVendor = value),
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
                onTap: _pickDate,
                child: Text(
                  selectedDate == null
                      ? "Delivery Date"
                      : "Delivery: ${selectedDate!.day}/${selectedDate!.month}/${selectedDate!.year}",
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
      padding: const EdgeInsets.all(12),
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
                    Text(inProgressOrderData?.customerName ?? '',
                        style: const TextStyle(
                            fontFamily: 'JosefinSans',
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: textColor)),
                    const SizedBox(height: 4),
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
                          Get.find<OrderController>().selectedWorkStatus);
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
                                .getOrderStatusList(Get.find<OrderController>()
                                    .selectedWorkStatus);
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
          Divider(),
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

// class OrderStatusPage extends StatefulWidget {
//   OrderController controller;
//   OrderStatusPage({super.key, required this.controller});

//   @override
//   State<OrderStatusPage> createState() => _OrderStatusPageState();
// }

// class _OrderStatusPageState extends State<OrderStatusPage> {
//   int selectedIndex = 0; // Default selected button

//   List<String> labels = ['CANCEL ORDER', 'COMPLETE STATUS'];
//   List<Color> borderColors = [brandGoldColor, brandGoldColor];

//   String? selectedWorkStatus;
//   String? selectedVendor;

//   final List<String> workStatusList = ['Status 1', 'Status 2', 'Status 3'];
//   final List<String> vendorList = ['Vendor 1', 'Vendor 2', 'Vendor 3'];
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Expanded(
//               child: workStatusDropdown(),
//             ),
//             SizedBox(width: 10),
//             Expanded(
//               child: vendorDropdown(),
//             ),
//             SizedBox(width: 10),
//             Expanded(
//               child: deliveryDateButton(),
//             ),
//           ],
//         ),
//         Expanded(
//           child: ListView.separated(
//             itemCount:
//                 widget.controller?.inProgressOrderListModel?.data?.length ?? 0,
//             separatorBuilder: (_, __) => const SizedBox(height: 12),
//             itemBuilder: (context, index) {
//               var InProgressData =
//                   widget.controller.inProgressOrderListModel?.data?[index];
//               return orderDetailsStatus(InProgressData);
//             },
//           ),
//         )
//       ],
//     );
//   }

//   Widget workStatusDropdown() {
//     return Container(
//       padding: const EdgeInsets.symmetric(horizontal: 12),
//       decoration: BoxDecoration(
//         border: Border.all(color: Colors.grey.shade400),
//         borderRadius: BorderRadius.circular(10),
//         color: Colors.white,
//       ),
//       child: DropdownButtonHideUnderline(
//         child: DropdownButton2<String>(
//           isExpanded: true,
//           hint: const Text("Work Status",
//               style: TextStyle(fontFamily: 'JosefinSans')),
//           value: selectedWorkStatus,
//           onChanged: (value) {
//             setState(() {
//               selectedWorkStatus = value;
//             });
//           },
//           items: workStatusList.map((item) {
//             return DropdownMenuItem<String>(
//               value: item,
//               child: Text(item),
//             );
//           }).toList(),
//         ),
//       ),
//     );
//   }

//   Widget vendorDropdown() {
//     return Container(
//       padding: const EdgeInsets.symmetric(horizontal: 12),
//       decoration: BoxDecoration(
//         border: Border.all(color: Colors.grey.shade400),
//         borderRadius: BorderRadius.circular(10),
//         color: Colors.white,
//       ),
//       child: DropdownButtonHideUnderline(
//         child: DropdownButton2<String>(
//           isExpanded: true,
//           hint: const Text("Vendor Wise",
//               style: TextStyle(fontFamily: 'JosefinSans')),
//           value: selectedVendor,
//           onChanged: (value) {
//             setState(() {
//               selectedVendor = value;
//             });
//           },
//           items: vendorList.map((item) {
//             return DropdownMenuItem<String>(
//               value: item,
//               child: Text(item),
//             );
//           }).toList(),
//         ),
//       ),
//     );
//   }

//   Widget deliveryDateButton() {
//     return GestureDetector(
//       onTap: () async {
//         final selectedDate = await showDatePicker(
//           context: context,
//           initialDate: DateTime.now(),
//           firstDate: DateTime(2020),
//           lastDate: DateTime(2030),
//         );

//         if (selectedDate != null) {
//           print("Selected Delivery Date: $selectedDate");
//         }
//       },
//       child: Container(
//         padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
//         decoration: BoxDecoration(
//           color: Colors.white,
//           borderRadius: BorderRadius.circular(10),
//           border: Border.all(color: Colors.grey.shade400),
//         ),
//         child: const Text(
//           "Delivery Date",
//           style: TextStyle(
//             fontFamily: 'JosefinSans',
//             fontSize: 16,
//             color: Colors.black87,
//           ),
//         ),
//       ),
//     );
//   }

//   Widget orderDetailsStatus([InProgressOrderData? inProgressData]) {
//     return Padding(
//       padding: const EdgeInsets.all(12),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Row(
//             children: [
//               Container(
//                 padding: EdgeInsets.all(2), // Space between avatar and border
//                 decoration: BoxDecoration(
//                   shape: BoxShape.circle,
//                   border: Border.all(color: white8, width: 1),
//                 ),
//                 child: CircleAvatar(
//                   backgroundColor: Colors.white,
//                   radius: 24,
//                   child: Icon(Icons.shopping_cart, color: Colors.black),
//                 ),
//               ),
//               const SizedBox(width: 10),
//               Expanded(
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(inProgressData?.customerName ?? "",
//                         style: const TextStyle(
//                             fontFamily: 'JosefinSans',
//                             fontSize: 16,
//                             fontWeight: FontWeight.w500,
//                             color: textColor)),
//                     const SizedBox(height: 4),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Text(
//                           inProgressData?.productName ?? "",
//                           style: TextStyle(
//                               fontFamily: 'JosefinSans',
//                               fontWeight: FontWeight.w500,
//                               color: brandGreyColor),
//                         ),
//                         Text(' ${inProgressData?.netWt ?? ""}g',
//                             style: TextStyle(
//                                 fontFamily: 'JosefinSans',
//                                 fontWeight: FontWeight.w500,
//                                 color: brandGreyColor)),
//                         Text(inProgressData?.orderDate ?? "",
//                             style: TextStyle(
//                                 fontFamily: 'JosefinSans',
//                                 fontWeight: FontWeight.w500,
//                                 color: brandGreyColor)),
//                       ],
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//           const SizedBox(height: 10),
//           Row(
//             children: [
//               HorizontalStatusStep(
//                 label: 'Allocated',
//                 completed: true,
//                 isFirst: true,
//                 isLast: false,
//               ),
//               HorizontalStatusStep(
//                 label: 'In Progress',
//                 completed: inProgressData?.orderStatusName == "Work in Progress"
//                     ? true
//                     : false,
//                 isFirst: false,
//                 isLast: false,
//               ),
//               HorizontalStatusStep(
//                 label: 'Completed',
//                 completed: false,
//                 isFirst: false,
//                 isLast: false,
//               ),
//               HorizontalStatusStep(
//                 label: 'Delivered',
//                 completed: false,
//                 isFirst: false,
//                 isLast: true,
//               ),
//             ],
//           ),
//           const SizedBox(height: 10),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceAround,
//             children: List.generate(labels.length, (index) {
//               return GestureDetector(
//                 onTap: () {
//                   setState(() {
//                     selectedIndex = index;
//                   });
//                   if (selectedIndex == 0) {
//                     Get.find<OrderController>().OrderCancelStatus(body: {
//                       "cancel_reason": "Any",
//                       "detail_id": "${inProgressData?.detailId ?? 0}",
//                       "id_job_order_detail":
//                           "${inProgressData?.idJobOrderDetail ?? 0}",
//                       "status": 6
//                     });
//                   } else {
//                     Get.find<OrderController>().OrderCompleteStatus(body: {
//                       "detail_id": "${inProgressData?.detailId ?? 0}",
//                       "added_through": 2,
//                       "id_job_order_detail":
//                           "${inProgressData?.idJobOrderDetail ?? 0}",
//                       "status": 4 // 4 = Complete, 5 = Delivered
//                     });
//                   }
//                 },
//                 child: actionButton(
//                   labels[index],
//                   borderColors[index],
//                   isSelected: selectedIndex == index,
//                 ),
//               );
//             }),
//           ),
//           SizedBox(height: 10),
//           Divider(),
//         ],
//       ),
//     );
//   }

//   Widget actionButton(String label, Color borderColor,
//       {required bool isSelected}) {
//     return Container(
//         margin: const EdgeInsets.only(right: 8),
//         padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
//         decoration: BoxDecoration(
//           color: isSelected ? borderColor : Colors.white,
//           border: Border.all(color: borderColor, width: 1.5),
//           borderRadius: BorderRadius.circular(10),
//         ),
//         child: Row(
//           children: [
//             Text(
//               label,
//               style: TextStyle(
//                 fontFamily: 'JosefinSans',
//                 fontWeight: FontWeight.w500,
//                 color: isSelected ? Colors.white : borderColor,
//               ),
//             ),
//           ],
//         ));
//   }
// }

// class HorizontalStatusStep extends StatelessWidget {
//   final String label;
//   final bool completed;
//   final bool isFirst;
//   final bool isLast;

//   const HorizontalStatusStep({
//     super.key,
//     required this.label,
//     required this.completed,
//     required this.isFirst,
//     required this.isLast,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Expanded(
//       child: Column(
//         children: [
//           Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               if (!isFirst)
//                 Expanded(
//                   child: Container(
//                     height: 2,
//                     color: brandGoldColor,
//                   ),
//                 ),
//               Column(
//                 children: [
//                   Container(
//                     padding: const EdgeInsets.all(2),
//                     decoration: BoxDecoration(
//                       shape: BoxShape.circle,
//                       border: Border.all(
//                         color: brandGoldColor,
//                         width: 1,
//                       ),
//                     ),
//                     child: CircleAvatar(
//                       backgroundColor: Colors.white,
//                       radius: 15,
//                       child: completed
//                           ? const Icon(Icons.check,
//                               color: brandGoldColor, size: 16)
//                           : const Icon(Icons.circle,
//                               size: 12, color: brandGoldColor),
//                     ),
//                   ),
//                   Text(
//                     label,
//                     style: const TextStyle(
//                       fontFamily: 'JosefinSans',
//                       fontWeight: FontWeight.w500,
//                       fontSize: 12,
//                       color: brandGreyColor,
//                     ),
//                   ),
//                 ],
//               ),
//               if (!isLast)
//                 Expanded(
//                   child: Container(
//                     height: 2,
//                     color: brandGoldColor,
//                   ),
//                 ),
//             ],
//           ),
//           const SizedBox(height: 4),
//         ],
//       ),
//     );
//   }
// }
