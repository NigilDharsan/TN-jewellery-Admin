import 'package:flutter/material.dart';
import 'package:tn_jewellery_admin/utils/colors.dart';
import 'package:tn_jewellery_admin/utils/styles.dart';

class EstimateDetailsPage2 extends StatefulWidget {
  const EstimateDetailsPage2({super.key});

  @override
  State<EstimateDetailsPage2> createState() => _EstimateDetailsPage2State();
}

class _EstimateDetailsPage2State extends State<EstimateDetailsPage2> {
  int? selectedEmployeeId;

  double totalGram = 0;
  int totalAmount = 0;
  int oldGoldTotalAmount = 0;
  int netAmount = 0;

  @override
  void initState() {
    super.initState();
    calculateTotals(); // Call total calculation when widget initializes
  }

  void calculateTotals() {
    totalGram = 0;
    totalAmount = 0;
    oldGoldTotalAmount = 0;

    for (var item in carratDetails) {
      totalGram += double.tryParse(item['gram'].replaceAll('g', '')) ?? 0;
      totalAmount += int.tryParse(item['amount']) ?? 0;
    }

    for (var item in oldDetails) {
      oldGoldTotalAmount += int.tryParse(item['amount']) ?? 0;
    }

    netAmount = totalAmount - oldGoldTotalAmount;
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
  final List<Map<String, dynamic>> oldDetails = [
    {
      'name': 'Gold Item',
      'gram': '4.5g',
      'carrat': '22K',
      'icon': Icons.delete_outline,
      'amount': '5000',
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
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'OLD GOLD',
                      style: tag3,
                    ),
                  ],
                ),
                SizedBox(height: 30),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ...oldDetails.map((item) {
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
                                '-₹${item['amount']}',
                                style: tag1,
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
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          SizedBox(
                            width: 100,
                            child: Text(
                              'Total',
                              style: tag1,
                            ),
                          ),
                          SizedBox(
                            width: 115,
                            child: Text(
                              '₹$netAmount',
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
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Text('Minimun ₹', style: tag2),
                    Row(
                      children: [
                        Text('150,000', style: tag1),
                        SizedBox(width: 8), // Spacing between text and icon
                        Icon(
                          Icons.notifications_paused_outlined,
                          size: 15,
                          color: textColor,
                        )
                      ],
                    )
                  ],
                ),
                Column(
                  children: [
                    Text('Discount ₹', style: tag2),
                    Container(
                      height: 30,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.white, width: 2),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius: 5,
                            offset: Offset(0, 1),
                          ),
                        ],
                      ),
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            // Wraps content tightly
                            children: [
                              Text('150,000', style: tag1),
                              SizedBox(width: 8),
                              // Spacing between text and icon
                              Icon(
                                Icons.mode_edit_outlined,
                                size: 15,
                                color: textColor,
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    color: brandPrimaryColor,
                    shape: BoxShape.circle,
                    border: Border.all(color: brandPrimaryColor),
                  ),
                  child: const Center(
                    child: Icon(Icons.add, size: 30, color: Colors.white),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      // Handle tag number tap
                    },
                    child: Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: brandGoldColor),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(Icons.add_box_outlined,
                              color: Colors.white),
                          Text(
                            'PRINT & APPROVE',
                            style: TextStyle(
                              fontFamily: 'JosefinSans',
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: brandGoldColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
