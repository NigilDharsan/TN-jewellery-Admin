import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tn_jewellery_admin/features/Estimate_Creation/Gold_Screen/New_Gold_Screen.dart';
import 'package:tn_jewellery_admin/features/Estimate_Creation/Gold_Screen/Old_Gold_Screen.dart';
import 'package:tn_jewellery_admin/features/Estimate_Creation/Scan_Tag_Page/Eatimate_details_Page2.dart';
import 'package:tn_jewellery_admin/utils/colors.dart';
import 'package:tn_jewellery_admin/utils/styles.dart';

class EstimateDetailsPage1 extends StatefulWidget {
  const EstimateDetailsPage1({super.key});

  @override
  State<EstimateDetailsPage1> createState() => _EstimateDetailsPage1State();
}

class _EstimateDetailsPage1State extends State<EstimateDetailsPage1> {
  int? selectedEmployeeId;

  double totalGram = 0;
  int totalAmount = 0;

  @override
  void initState() {
    super.initState();
    calculateTotals(); // Call total calculation when widget initializes
  }

  void calculateTotals() {
    totalGram = 0;
    totalAmount = 0;
    for (var item in carratDetails) {
      totalGram += double.tryParse(item['gram'].replaceAll('g', '')) ?? 0;
      totalAmount += int.tryParse(item['amount']) ?? 0;
    }
  }

  final List<Map<String, dynamic>> carratDetails = [
    {
      'name': 'Gold Ring',
      'gram': '4.5g',
      'carrat': '22K',
      'icon': Icons.delete_outline,
      'amount': '10000',
    },
    {
      'name': 'Silver Ring',
      'gram': '3.2g',
      'carrat': '18K',
      'icon': Icons.delete_outline,
      'amount': '30000',
    },
    {
      'name': 'Platinum Ring',
      'gram': '5.1g',
      'carrat': '24K',
      'icon': Icons.delete_outline,
      'amount': '40000',
    },
  ];

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
        title: const Text('ESTIMATE CREATION',
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Column(
                      children: [
                        Text(
                          'Customer',
                          style: tag2,
                        ),
                        Text(
                          'Santhosh',
                          style: tag1,
                        ),
                      ],
                    ),
                    SizedBox(width: 140),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Contact',
                            style: tag2,
                          ),
                          Text(
                            '9876543210',
                            style: tag1,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 50),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'NEW JEWELLERY',
                      style: tag3,
                    ),
                  ],
                ),
                SizedBox(height: 30),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ...carratDetails.map((item) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5),
                        child: Row(
                          children: [
                            SizedBox(
                              width: 180,
                              child: Text(
                                '${item['name']} | ${item['carrat']}',
                                style: tag2,
                              ),
                            ),
                            SizedBox(
                              width: 80,
                              child: Text(
                                item['gram'],
                                style: tag2,
                              ),
                            ),
                            SizedBox(
                              width: 70,
                              child: Text(
                                '₹${item['amount']}',
                                style: tag2,
                              ),
                            ),
                            Icon(item['icon']),
                          ],
                        ),
                      );
                    }).toList(),
                    const Divider(color: brandGreyColor),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Row(
                        children: [
                          SizedBox(
                            width: 180,
                            child: Text(
                              'Total',
                              style: tag1,
                            ),
                          ),
                          SizedBox(
                            width: 80,
                            child: Text('${totalGram.toStringAsFixed(1)}g',
                                style: tag1),
                          ),
                          SizedBox(
                            width: 100,
                            child: Text(
                              '₹$totalAmount',
                              style: tag1,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 30),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'OLD GOLD',
                  style: tag3,
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    height: 140,
                    width: 250,
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                          icon: Icon(Icons.qr_code_scanner),
                          onPressed: () async {},
                        ),
                        Text('SCAN',
                            style: TextStyle(
                                fontFamily: 'JosefinSans',
                                fontSize: 18,
                                fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      Get.to(EstimateDetailsPage2());
                    },
                    child: Container(
                      height: 140,
                      width: 150,
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: brandGoldColor,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('TAG NO',
                              style: TextStyle(
                                  fontFamily: 'JosefinSans',
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white)),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      Get.to(NewGoldScreen());
                    },
                    child: Container(
                      height: 80,
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: Colors.grey[400]!),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('NEW ITEM',
                              style: TextStyle(
                                  fontFamily: 'JosefinSans',
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold)),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      Get.to(OldGoldScreen());
                    },
                    child: Container(
                      height: 80,
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Colors.amber[50],
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: brandGoldColor),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('OLD GOLD',
                              style: TextStyle(
                                  fontFamily: 'JosefinSans',
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black)),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            GestureDetector(
              onTap: () {
                // Handle tag number tap
              },
              child: Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: brandPrimaryColor,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.grey[400]!),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(Icons.add_box_outlined, color: Colors.white),
                    SizedBox(width: 10),
                    Text('ADD NEW ITEM',
                        style: TextStyle(
                            fontFamily: 'JosefinSans',
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.white)),
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
