import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tn_jewellery_admin/features/Estimate_Creation/Gold_Screen/Stone_Details_Page.dart';
import 'package:tn_jewellery_admin/features/Estimate_Creation/Scan_Tag_Page/Estimate_details_Page1.dart';
import 'package:tn_jewellery_admin/utils/colors.dart';
import 'package:tn_jewellery_admin/utils/styles.dart';
import 'package:tn_jewellery_admin/utils/widgets/Common_drop_down_field.dart';

class OldGoldScreen extends StatefulWidget {
  const OldGoldScreen({super.key});

  @override
  State<OldGoldScreen> createState() => _OldGoldScreenState();
}

class _OldGoldScreenState extends State<OldGoldScreen> {
  int? selectedEmployeeId;
  bool isSwitched = false;

  @override
  void initState() {
    super.initState();
    selectedEmployeeId = 1;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_sharp),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text('OLD GOLD DETAILS',
            style: TextStyle(
                fontFamily: 'JosefinSans',
                fontSize: 18,
                color: brandGreyColor,
                fontWeight: FontWeight.bold)),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                Row(
                  children: [
                    Expanded(
                      child: buildTextField(
                          title: "PRODUCT",
                          hint: "Product"),
                    ),
                    Expanded(
                      child: CustomDropdown(title: "ITEM TYPE"),
                    ),
                    Expanded(
                      child: CustomDropdown(title: "TOUCH"),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                        child: grossWeight(
                            title: "GROSS WEIGHT",
                            hint: "",
                            onTap: () {
                              Get.to(StoneDetailsPage());
                            })),
                    Expanded(
                        child: grossWeight(
                            title: "LESS WEIGHT",
                            hint: "",
                            onTap: () {
                              Get.to(StoneDetailsPage());
                            })),
                    Expanded(
                        child: grossWeight(
                            title: "NET WEIGHT",
                            hint: "",
                            onTap: () {
                              Get.to(StoneDetailsPage());
                            })),
                  ],
                ),
                Row(
                  children: [

                    Expanded(child:  buildTextField(
                        title: "NO.OF.PSC",
                        hint: "1")),
                    Expanded(child: CustomDropdown(title: "DUST WEIGHT")),

                  ],
                ),
                Row(
                  children: [
                    Expanded(child: CustomDropdown(title: "RATE PER GRAM")),
                    Expanded(child: CustomDropdown(title: "ITEM COST")),
                  ],
                ),
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Row(
                    children: [
                      Text(
                        isSwitched ? 'STONE' : 'STONE',
                        style: tag1,
                      ),
                      SizedBox(width: 10),
                      Switch(
                        value: isSwitched,
                        onChanged: (value) {
                          setState(() {
                            isSwitched = value;
                          });
                        },
                        activeColor: Colors.white,
                        inactiveThumbColor: Colors.white,
                        activeTrackColor: Colors.grey,
                        inactiveTrackColor: Colors.grey,
                      )
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Get.to(() => const StoneDetailsPage(), arguments: {'showAddButton': false});
                  },
                  child: Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      color: brandGoldColor,
                      shape: BoxShape.circle,
                    ),
                    child: const Center(
                      child: Icon(Icons.add, size: 30, color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Stone NAME', style: tag2),
                          Text('DIAMOND', style: tag1),
                        ],
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Stone Weight', style: tag2),
                          Text('3 GRAMS', style: tag1),
                        ],
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Rate', style: tag2),
                          Text('2,000', style: tag1),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Divider(
              color: brandGreySoftColor,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Customer rate ₹', style: tag2),
                        Container(
                            width: 80,
                            padding: EdgeInsets.symmetric(
                                horizontal: 5, vertical: 5),
                            decoration: BoxDecoration(
                              color: Colors.grey[100],
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(color: Colors.white, width: 2),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black26,
                                  blurRadius: 5,
                                  offset: Offset(0, 1),
                                ),
                              ],
                            ),
                            child: Text('10,000', style: tag1)),
                      ],
                    ),
                  ],
                ),
                Column(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Net Value ₹', style: tag2),
                        Text('3 GRAMS', style: tag1),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 20),
            GestureDetector(
              onTap: () {
                Get.to(EstimateDetailsPage1());
              },
              child: Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: brandGoldColor),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(Icons.add_box_outlined, color: Colors.white),
                    Text('NEXT',
                        style: TextStyle(
                            fontFamily: 'JosefinSans',
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: brandGoldColor)),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
