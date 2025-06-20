import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tn_jewellery_admin/features/Estimate_Creation/Gold_Screen/Controller/Drop_Down_Controller.dart';
import 'package:tn_jewellery_admin/features/Estimate_Creation/Scan_Tag_Page/Estimate_details_Page1.dart';
import 'package:tn_jewellery_admin/utils/colors.dart';
import 'package:tn_jewellery_admin/utils/styles.dart';

class ScanPages extends StatefulWidget {
  const ScanPages({super.key});

  @override
  State<ScanPages> createState() => _ScanPagesState();
}

class _ScanPagesState extends State<ScanPages> {
  int? selectedEmployeeId;
  final TextEditingController tagController = TextEditingController();
  final dropdownController = Get.put(DropdownController());

  final List<Map<String, dynamic>> carratDetails = [
    {
      'name': 'Gold Ring',
      'gram': '4.5g',
      'price': '22000',
      'icon': Icons.delete_outline,
    },
    {
      'name': 'Silver Ring',
      'gram': '3.2g',
      'price': '18000',
      'icon': Icons.delete_outline,
    },
    {
      'name': 'Platinum Ring',
      'gram': '5.1g',
      'price': '24000',
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
                        crossAxisAlignment: CrossAxisAlignment.start,
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
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 20),
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
                                                icon:
                                                    Icon(Icons.qr_code_scanner),
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
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 12),
                                    decoration: BoxDecoration(
                                      borderRadius: const BorderRadius.only(
                                        topLeft: Radius.circular(10),
                                        bottomLeft: Radius.circular(10),
                                      ),
                                      border: Border.all(color: brandGoldColor),
                                    ),
                                    child: TextField(
                                      controller: tagController,
                                      style: TextStyle(color: Colors.black),
                                      decoration: InputDecoration(
                                        hintText: "TAG",
                                        hintStyle:
                                            TextStyle(color: Colors.white54),
                                        border: InputBorder
                                            .none, // removes default underline
                                      ),
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      final value = tagController.text.trim();
                                      if (value.isNotEmpty) {
                                        setState(() {
                                          carratDetails.add({
                                            'name': value,
                                            'gram': '1.5g',
                                            'price': '2500',
                                            'icon': Icons.delete_outline,
                                          });
                                          tagController.clear();
                                        });
                                      }
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
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: carratDetails.map((item) {
                                        return Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 4),
                                          child: Row(
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
                                              // Gram
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
                                              // Price
                                              SizedBox(
                                                width: 80,
                                                child: Text(
                                                  '₹${item['price']}',
                                                  style: const TextStyle(
                                                    fontFamily: 'JosefinSans',
                                                    fontSize: 15,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                ),
                                              ),
                                              // Delete Icon
                                              IconButton(
                                                icon: Icon(item['icon']),
                                                onPressed: () {
                                                  setState(() {
                                                    carratDetails.remove(item);
                                                  });
                                                },
                                              ),
                                            ],
                                          ),
                                        );
                                      }).toList(),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 50),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Expanded(
                                    child: Column(
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text('Gross Weight', style: tag2),
                                            Text(
                                              '${dropdownController.grossSelected.value} GRAMS',
                                              style: tag1,
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                    child: Column(
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text('Less Weight', style: tag2),
                                            Text(
                                              '${dropdownController.lessSelected.value} GRAMS',
                                              style: tag1,
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                    child: Column(
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text('Net Weight', style: tag2),
                                            Text(
                                              '${dropdownController.netSelected.value} GRAMS',
                                              style: tag1,
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          GestureDetector(
                            onTap: () {
                              Get.to(EstimateDetailsPage1());
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
                      )),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
