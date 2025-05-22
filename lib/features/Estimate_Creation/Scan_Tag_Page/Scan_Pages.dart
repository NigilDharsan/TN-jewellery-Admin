import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tn_jewellery_admin/features/Estimate_Creation/Scan_Tag_Page/Estimate_details_Page1.dart';
import 'package:tn_jewellery_admin/utils/colors.dart';

class ScanPages extends StatefulWidget {
  const ScanPages({super.key});

  @override
  State<ScanPages> createState() => _ScanPagesState();
}

class _ScanPagesState extends State<ScanPages> {
  int? selectedEmployeeId;

  final List<Map<String, dynamic>> carratDetails = [
    {
      'name': 'Gold Ring',
      'gram': '4.5g',
      'carrat': '22K',
      'icon': Icons.delete_outline,
    },
    {
      'name': 'Silver Ring',
      'gram': '3.2g',
      'carrat': '18K',
      'icon': Icons.delete_outline,
    },
    {
      'name': 'Platinum Ring',
      'gram': '5.1g',
      'carrat': '24K',
      'icon': Icons.delete_outline,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   leading: IconButton(
      //     icon: const Icon(Icons.arrow_back_ios_new_sharp),
      //     onPressed: () {
      //       Navigator.pop(context);
      //     },
      //   ),
      //   title: const Text('ESTIMATE CREATION',
      //       style: TextStyle(
      //           fontFamily: 'JosefinSans',
      //           fontSize: 18,
      //           color: brandGreyColor,
      //           fontWeight: FontWeight.bold)),
      // ),
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: constraints.maxHeight),
                child: IntrinsicHeight(
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: GestureDetector(
                                    onTap: () {
                                      // Handle tag number tap
                                    },
                                    child: Padding(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 20),
                                      child: Container(
                                        height: 140,
                                        padding: EdgeInsets.all(12),
                                        decoration: BoxDecoration(
                                          color: Colors.grey[200],
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            IconButton(
                                              icon: Icon(Icons.qr_code_scanner),
                                              onPressed: () async {
                                                // Scanner logic
                                              },
                                            ),
                                            Text(
                                              'SCAN',
                                              style: TextStyle(
                                                fontFamily: 'JosefinSans',
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 30),
                            Text('TAG NO',
                                style: TextStyle(
                                    fontFamily: 'JosefinSans',
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black)),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  height: 55,
                                  width: 180,
                                  padding: const EdgeInsets.all(12),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(10),
                                      bottomLeft: Radius.circular(10),
                                    ),
                                    border: Border.all(color: brandGoldColor),
                                  ),
                                  child: const Text(
                                    "TAG", // Replace with your tag or number
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Get.to(EstimateDetailsPage1());
                                  },
                                  child: Container(
                                    height: 55,
                                    padding: const EdgeInsets.all(12),
                                    decoration: BoxDecoration(
                                      color: brandGoldColor,
                                      borderRadius: BorderRadius.only(
                                          topRight: Radius.circular(10),
                                          bottomRight: Radius.circular(10)),
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Icon(
                                          Icons.arrow_forward,
                                          color: Colors.white,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 80),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: carratDetails.map((item) {
                                    return Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 5),
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(
                                            width: 120,
                                            child: Text(
                                              item['name'],
                                              style: const TextStyle(
                                                fontFamily: 'JosefinSans',
                                                fontSize: 15,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            width: 80,
                                            child: Text(
                                              item['gram'],
                                              style: const TextStyle(
                                                fontFamily: 'JosefinSans',
                                                fontSize: 15,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            width: 80,
                                            child: Text(
                                              item['carrat'],
                                              style: const TextStyle(
                                                fontFamily: 'JosefinSans',
                                                fontSize: 15,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          ),
                                          Icon(item['icon']),
                                        ],
                                      ),
                                    );
                                  }).toList(),
                                ),
                              ],
                            ),
                          ],
                        ),
                        GestureDetector(
                          onTap: () {
                          },
                          child: Container(
                            margin: EdgeInsets.all(40),
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(color: brandGoldColor),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Icon(Icons.add_box_outlined,
                                    color: Colors.white),
                                Text(
                                  'NEXT',
                                  style: TextStyle(
                                    fontFamily: 'JosefinSans',
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: brandGoldColor,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
