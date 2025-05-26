import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tn_jewellery_admin/features/Estimate_Creation/Gold_Screen/Stone_Details_Page.dart';
import 'package:tn_jewellery_admin/features/Estimate_Creation/Scan_Tag_Page/Estimate_details_Page1.dart';
import 'package:tn_jewellery_admin/utils/colors.dart';
import 'package:tn_jewellery_admin/utils/styles.dart';
import 'package:tn_jewellery_admin/utils/widgets/Common_drop_down_field.dart';

class NewGoldScreen extends StatefulWidget {
  const NewGoldScreen({super.key});

  @override
  State<NewGoldScreen> createState() => _NewGoldScreenState();
}

class _NewGoldScreenState extends State<NewGoldScreen> {
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
        title: const Text('ADDING NEW PIECE',
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
                      child: CustomDropdown(title: "PRODUCT"),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: CustomDropdown(title: "DESIGN NAME"),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: CustomDropdown(title: "PURITY"),
                    ),
                    Expanded(child:   buildTextField(
                        title: "NO.OF.PSC",
                        hint: "1")),
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
                    Expanded(child: CustomDropdown(title: "WASTAGE %")),
                    Expanded(child: buildTextField(title: "MC PER", hint: "1")),
                  ],
                ),
                Row(
                  children: [
                    Expanded(child: CustomDropdown(title: "MAKING %")),
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
                    Get.to(() => const StoneDetailsPage(), arguments: {'showAddButton': true});

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
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Gross Weight', style: tag2),
                          Text('30 GRM', style: tag1),
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
                          Text('Less Weight', style: tag2),
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
                          Text('Net Weight', style: tag2),
                          Text('9 GRAMS', style: tag1),
                        ],
                      ),
                    ],
                  ),
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
