import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tn_jewellery_admin/features/my_order/controller/order_controller.dart';
import 'package:tn_jewellery_admin/features/my_order/widgets/orderDetailWidgets.dart';
import 'package:tn_jewellery_admin/utils/colors.dart';
import 'package:tn_jewellery_admin/utils/styles.dart';
import 'package:tn_jewellery_admin/utils/widgets/custom_app_bar.dart';

class orderDetailScreen extends StatefulWidget {
  const orderDetailScreen({super.key});

  @override
  State<orderDetailScreen> createState() => _orderDetailScreenState();
}

class _orderDetailScreenState extends State<orderDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(50),
          child: CustomAppBar(
            title: 'SPARKLE RING',
            isBackButtonExist: true,
          )),
      body: GetBuilder<OrderController>(builder: (controller) {
        return controller.isLoading
            ? Container()
            : buildOrderDetail(controller);
      }),
    );
  }
}

Widget buildOrderDetail(OrderController controller) {
  return SingleChildScrollView(
    padding: EdgeInsets.only(left: 20, right: 20),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Retailer Name", style: customer2),
                Text(controller.selectNewOrderListData?.customerName ?? "",
                    style: customer1),
              ],
            ),
            Container(
              height: 40,
              width: 150,
              decoration: BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                child: Text(
                  controller.selectNewOrderListData?.orderStatusName ?? "",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Due Date", style: customer2),
                Text(controller.selectNewOrderListData?.customerDueDate ?? "",
                    style: customer1),
              ],
            ),
            // Column(
            //   crossAxisAlignment: CrossAxisAlignment.start,
            //   children: const [
            //     Text("Work Order Type", style: customer2),
            //     Text("New Size", style: customer1),
            //   ],
            // ),
          ],
        ),
        const SizedBox(height: 10),
        const Text("JEWEL DETAILS",
            style: TextStyle(
                color: brandPrimaryColor,
                fontFamily: 'JosefinSans',
                fontSize: 16,
                fontWeight: FontWeight.bold)),
        const Divider(),

        Text(controller.selectNewOrderListData?.productName ?? "",
            style: TextStyle(
                color: brandGreyColor,
                fontSize: 15,
                fontWeight: FontWeight.bold)),

        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text("Weight", style: customer2),
              Text(controller.selectNewOrderListData?.grossWt ?? "",
                  style: customer1),
            ]),
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text("Design ", style: customer2),
              Text(controller.selectNewOrderListData?.designName ?? "",
                  style: customer1),
            ]),
          ],
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text("Purity", style: customer2),
              Text("91.6", style: customer1),
            ]),
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text("Dimension", style: customer2),
              Text(controller.selectNewOrderListData?.size ?? "",
                  style: customer1),
            ]),
          ],
        ),
        const SizedBox(height: 15),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text("Stone Type", style: customer2),
              Text(controller.selectNewOrderListData?.customizedStoneName ?? "",
                  style: customer1),
            ]),
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text("Stone Weight", style: customer2),
              Text(controller.selectNewOrderListData?.stoneWt ?? "",
                  style: customer1),
            ]),
          ],
        ),
        // const SizedBox(height: 15),
        // Column(
        //   crossAxisAlignment: CrossAxisAlignment.start,
        //   children: const [
        //     Text("Stone quantity", style: customer2),
        //     Text("XXXXX123", style: customer1),
        //   ],
        // ),
        const SizedBox(height: 10),
        const Text('Images & video Reference',
            style: TextStyle(
                color: white8,
                fontFamily: 'JosefinSans',
                fontSize: 15,
                fontWeight: FontWeight.bold)),
        const SizedBox(height: 10),

// Image and audio row 1
        Row(
          children: [
            Expanded(
              child: Row(
                children: const [
                  Icon(Icons.photo, color: brandGreyColor),
                  SizedBox(width: 5),
                  Expanded(
                    child: Text(
                      "photo_01_jpg",
                      style: TextStyle(
                          color: white8,
                          fontSize: 16,
                          fontFamily: 'JosefinSans',
                          fontWeight: FontWeight.bold),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Icon(Icons.arrow_downward, color: brandGreyColor),
                  Icon(Icons.remove_red_eye_outlined, color: brandGreyColor),
                ],
              ),
            ),
            SizedBox(width: 10),
            Expanded(
              child: Row(
                children: const [
                  Icon(Icons.volume_up, color: brandGreyColor),
                  SizedBox(width: 5),
                  Expanded(
                    child: Text(
                      "Audio 01.mp3",
                      style: TextStyle(
                          color: white8,
                          fontFamily: 'JosefinSans',
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Icon(Icons.arrow_downward, color: brandGreyColor),
                  Icon(Icons.play_arrow, color: brandGreyColor),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),

// Image and audio row 2
        Row(
          children: [
            Expanded(
              child: Row(
                children: const [
                  Icon(Icons.photo, color: brandGreyColor),
                  SizedBox(width: 5),
                  Expanded(
                    child: Text(
                      "photo_02_jpg",
                      style: TextStyle(
                          color: white8,
                          fontFamily: 'JosefinSans',
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Icon(Icons.arrow_downward, color: brandGreyColor),
                  Icon(Icons.remove_red_eye_outlined, color: brandGreyColor),
                ],
              ),
            ),
            SizedBox(width: 10),
            Expanded(
              child: Row(
                children: const [
                  Icon(Icons.volume_up, color: brandGreyColor),
                  SizedBox(width: 5),
                  Expanded(
                    child: Text(
                      "Audio 02.mp3",
                      style: TextStyle(
                          color: white8,
                          fontFamily: 'JosefinSans',
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Icon(Icons.arrow_downward, color: brandGreyColor),
                  Icon(Icons.play_arrow, color: brandGreyColor),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 20),

        const Text("Description",
            style: TextStyle(
                color: brandPrimaryColor,
                fontFamily: 'JosefinSans',
                fontSize: 16,
                fontWeight: FontWeight.bold)),
        Text(controller.selectNewOrderListData?.remarks ?? "",
            style: customer1),
        const SizedBox(height: 20),

        buildChangeStatus(controller),
        const SizedBox(height: 15),
        buildSelectButton(),
      ],
    ),
  );
}
