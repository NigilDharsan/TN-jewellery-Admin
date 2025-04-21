import 'package:flutter/material.dart';
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
      appBar: PreferredSize(preferredSize: Size.fromHeight(50),
          child: CustomAppBar(
            title: 'SPARKLE RING',
            isBackButtonExist: true,
          )),
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(left: 20,right: 20),
        child:  Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text("Retailer Name", style: customer2),
                    Text("Raja Jewellery", style: customer1),
                  ],
                ),
                Container(
                  height: 40,
                  width: 150,
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Center(
                    child: Text(
                      "RECEIVED",
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
                  children: const [
                    Text("Delivery Date", style: customer2),
                    Text("12/02/2025", style: customer1),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text("Work Order Type", style: customer2),
                    Text("New Size", style: customer1),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 10),
            const Text("JEWEL DETAILS", style: TextStyle(color: brandPrimaryColor,  fontFamily: 'JosefinSans',fontSize: 16, fontWeight: FontWeight.bold)),
            const Divider(),

            const Text("Ring", style: TextStyle(color: brandGreyColor, fontSize: 15, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            const Text(
              'Some Text describing the changes the customer is looking for',
              style: TextStyle(color: brandGreyColor,  fontFamily: 'JosefinSans',fontSize: 14, fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: const [
                  Text("Weight", style: customer2),
                  Text("12g", style: customer1),
                ]),
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: const [
                  Text("Design Type", style: customer2),
                  Text("Light Weight", style: customer1),
                ]),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: const [
                  Text("Purity", style: customer2),
                  Text("91.6", style: customer1),
                ]),
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: const [
                  Text("Dimension", style: customer2),
                  Text("15 W X 12 H", style: customer1),
                ]),
              ],
            ),
            const SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: const [
                  Text("Stone Type", style: customer2),
                  Text("Diamond", style: customer1),
                ]),
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: const [
                  Text("Stone Weight", style: customer2),
                  Text("3 Grams", style: customer1),
                ]),
              ],
            ),
            const SizedBox(height: 15),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text("Stone quantity", style: customer2),
                Text("XXXXX123", style: customer1),
              ],
            ),
            const SizedBox(height: 10),
            const Text('Images & video Reference', style: TextStyle(color: white8, fontFamily: 'JosefinSans', fontSize: 15, fontWeight: FontWeight.bold)),
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
                          style: TextStyle(color: white8, fontSize: 16,  fontFamily: 'JosefinSans',fontWeight: FontWeight.bold),
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
                          style: TextStyle(color: white8, fontFamily: 'JosefinSans', fontSize: 16, fontWeight: FontWeight.bold),
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
                          style: TextStyle(color: white8,  fontFamily: 'JosefinSans',fontSize: 16, fontWeight: FontWeight.bold),
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
                          style: TextStyle(color: white8,  fontFamily: 'JosefinSans',fontSize: 16, fontWeight: FontWeight.bold),
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
            buildChangeStatus(),
            const SizedBox(height: 15),
            buildSelectButton(),
          ],
        ),
      ),
    );
  }
}
