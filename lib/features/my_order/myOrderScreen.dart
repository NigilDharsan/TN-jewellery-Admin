import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tn_jewellery_admin/features/my_order/OrderStatusScreen.dart';
import 'package:tn_jewellery_admin/features/my_order/controller/order_controller.dart';
import 'package:tn_jewellery_admin/features/my_order/widgets/myOrderWidgets.dart';
import 'package:tn_jewellery_admin/utils/widgets/custom_app_bar.dart';

class myOrderScreen extends StatefulWidget {
  const myOrderScreen({super.key});

  @override
  State<myOrderScreen> createState() => _myOrderScreenState();
}

class _myOrderScreenState extends State<myOrderScreen> {
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    Get.find<OrderController>().isNewOrdersSelected = true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(50),
          child: CustomAppBar(
            title: 'CUSTOM ORDERS',
            isBackButtonExist: false,
          )),
      body: GetBuilder<OrderController>(initState: (state) {
        Get.find<OrderController>().getSupplierList();

        if (Get.find<OrderController>().isNewOrdersSelected == true) {
          Get.find<OrderController>().getNewOrderList();
        } else {
          Get.find<OrderController>().getOrderStatusList("inprogress",
              Get.find<OrderController>().filterBody); //delivery_ready
        }
      }, builder: (controller) {
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
                  "New Orders", controller.isNewOrdersSelected, () {
                controller.isNewOrdersSelected = true;
                controller.getNewOrderList();
              }),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: buildTabButton(
                  "Order Status", !controller.isNewOrdersSelected, () {
                controller.selectedWorkStatus = "In Progress";
                controller.selectedWorkStatusID = "inprogress";
                controller.selectedVendor = null;

                controller.filterBody = {
                  "id_supplier": "",
                  "id_customer": "",
                  "date": "",
                };

                controller.isNewOrdersSelected = false;
                controller.getOrderStatusList(
                    "inprogress", controller.filterBody); //delivery_ready
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
