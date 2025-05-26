import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tn_jewellery_admin/features/Estimate_Creation/Gold_Screen/New_Gold_Screen.dart';
import 'package:tn_jewellery_admin/features/Estimate_Creation/Gold_Screen/Old_Gold_Screen.dart';
import 'package:tn_jewellery_admin/features/Estimate_Creation/Scan_Tag_Page/Scan_Pages.dart';
import 'package:tn_jewellery_admin/utils/colors.dart';
import 'package:tn_jewellery_admin/utils/styles.dart';

// class EstimateDetailsPage1 extends StatefulWidget {
//   const EstimateDetailsPage1({super.key});
//
//   @override
//   State<EstimateDetailsPage1> createState() => _EstimateDetailsPage1State();
// }
//
// class _EstimateDetailsPage1State extends State<EstimateDetailsPage1> {
//   int? selectedEmployeeId;
//   bool Newdetails = true;
//   double totalGram = 0;
//   int totalAmount = 0;
//
//   @override
//   void initState() {
//     super.initState();
//     calculateTotals(); // Call total calculation when widget initializes
//   }
//
//   void calculateTotals() {
//     totalGram = 0;
//     totalAmount = 0;
//     for (var item in carratDetails) {
//       totalGram += double.tryParse(item['gram'].replaceAll('g', '')) ?? 0;
//       totalAmount += int.tryParse(item['amount']) ?? 0;
//     }
//   }
//
//   final List<Map<String, dynamic>> carratDetails = [
//     {
//       'name': 'Gold Ring',
//       'gram': '4.5g',
//       'carrat': '22K',
//       'icon': Icons.delete_outline,
//       'amount': '10000',
//     },
//     {
//       'name': 'Silver Ring',
//       'gram': '3.2g',
//       'carrat': '18K',
//       'icon': Icons.delete_outline,
//       'amount': '30000',
//     },
//     {
//       'name': 'Platinum Ring',
//       'gram': '5.1g',
//       'carrat': '24K',
//       'icon': Icons.delete_outline,
//       'amount': '40000',
//     },
//   ];
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         leading: IconButton(
//           icon: const Icon(Icons.arrow_back_ios_new_sharp),
//           onPressed: () {
//             Navigator.pop(context);
//           },
//         ),
//         title: const Text('ESTIMATE CREATION',
//             style: TextStyle(
//                 fontFamily: 'JosefinSans',
//                 fontSize: 18,
//                 color: brandGreyColor,
//                 fontWeight: FontWeight.bold)),
//       ),
//       body: SingleChildScrollView(
//         padding: const EdgeInsets.all(16),
//         child: Column(
//           children: [
//             Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.start,
//                   children: [
//                     Column(
//                       children: [
//                         Text(
//                           'Customer',
//                           style: tag2,
//                         ),
//                         Text(
//                           'Santhosh',
//                           style: tag1,
//                         ),
//                       ],
//                     ),
//                     SizedBox(width: 140),
//                     Expanded(
//                       child: Column(
//                         mainAxisAlignment: MainAxisAlignment.start,
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text(
//                             'Contact',
//                             style: tag2,
//                           ),
//                           Text(
//                             '9876543210',
//                             style: tag1,
//                           ),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//                 SizedBox(height: 50),
//                 Row(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       'NEW JEWELLERY',
//                       style: tag3,
//                     ),
//                   ],
//                 ),
//                 SizedBox(height: 30),
//                 Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     ...carratDetails.map((item) {
//                       return Padding(
//                         padding: const EdgeInsets.symmetric(vertical: 5),
//                         child: Row(
//                           children: [
//                             SizedBox(
//                               width: 180,
//                               child: Text(
//                                 '${item['name']} | ${item['carrat']}',
//                                 style: tag2,
//                               ),
//                             ),
//                             SizedBox(
//                               width: 80,
//                               child: Text(
//                                 item['gram'],
//                                 style: tag2,
//                               ),
//                             ),
//                             SizedBox(
//                               width: 70,
//                               child: Text(
//                                 '₹${item['amount']}',
//                                 style: tag2,
//                               ),
//                             ),
//                             Icon(item['icon']),
//                           ],
//                         ),
//                       );
//                     }).toList(),
//                     const Divider(color: brandGreyColor),
//                     Padding(
//                       padding: const EdgeInsets.symmetric(vertical: 8.0),
//                       child: Row(
//                         children: [
//                           SizedBox(
//                             width: 180,
//                             child: Text(
//                               'Total',
//                               style: tag1,
//                             ),
//                           ),
//                           SizedBox(
//                             width: 80,
//                             child: Text('${totalGram.toStringAsFixed(1)}g',
//                                 style: tag1),
//                           ),
//                           SizedBox(
//                             width: 100,
//                             child: Text(
//                               '₹$totalAmount',
//                               style: tag1,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//             SizedBox(height: 30),
//             Row(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   'OLD GOLD',
//                   style: tag3,
//                 ),
//               ],
//             ),
//             const SizedBox(height: 10),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 GestureDetector(
//                   onTap: () {
//                     Get.to(ScanPages());
//                   },
//                   child: Container(
//                     height: 140,
//                     width: 250,
//                     decoration: BoxDecoration(
//                       color: Colors.grey[200],
//                       borderRadius: BorderRadius.circular(8),
//                     ),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.center,
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         IconButton(
//                           icon: Icon(Icons.qr_code_scanner),
//                           onPressed: () async {},
//                         ),
//                         Text('SCAN',
//                             style: TextStyle(
//                                 fontFamily: 'JosefinSans',
//                                 fontSize: 18,
//                                 fontWeight: FontWeight.bold)),
//                       ],
//                     ),
//                   ),
//                 ),
//                 SizedBox(width: 10),
//                 Expanded(
//                   child: GestureDetector(
//                     onTap: () {
//                       Get.to(ScanPages());
//                     },
//                     child: Container(
//                       height: 140,
//                       width: 150,
//                       padding: const EdgeInsets.all(12),
//                       decoration: BoxDecoration(
//                         color: brandGoldColor,
//                         borderRadius: BorderRadius.circular(8),
//                       ),
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.center,
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           Text('TAG NO',
//                               style: TextStyle(
//                                   fontFamily: 'JosefinSans',
//                                   fontSize: 18,
//                                   fontWeight: FontWeight.bold,
//                                   color: Colors.white)),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//             const SizedBox(height: 20),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Expanded(
//                   child: GestureDetector(
//                     onTap: () {
//                       Get.to(NewGoldScreen());
//                     },
//                     child: Container(
//                       height: 80,
//                       padding: const EdgeInsets.all(12),
//                       decoration: BoxDecoration(
//                         color: Colors.white,
//                         borderRadius: BorderRadius.circular(8),
//                         border: Border.all(color: Colors.grey[400]!),
//                       ),
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.center,
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           Text('NEW ITEM',
//                               style: TextStyle(
//                                   fontFamily: 'JosefinSans',
//                                   fontSize: 16,
//                                   fontWeight: FontWeight.bold)),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ),
//                 SizedBox(width: 10),
//                 Expanded(
//                   child: GestureDetector(
//                     onTap: () {
//                       Get.to(OldGoldScreen());
//                     },
//                     child: Container(
//                       height: 80,
//                       padding: const EdgeInsets.all(12),
//                       decoration: BoxDecoration(
//                         color: Colors.amber[50],
//                         borderRadius: BorderRadius.circular(8),
//                         border: Border.all(color: brandGoldColor),
//                       ),
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.center,
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           Text('OLD GOLD',
//                               style: TextStyle(
//                                   fontFamily: 'JosefinSans',
//                                   fontSize: 16,
//                                   fontWeight: FontWeight.bold,
//                                   color: Colors.black)),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//             const SizedBox(height: 20),
//             GestureDetector(
//               onTap: () {
//                 Get.to(EstimateDetailsPage2()); // Handle tag number tap
//               },
//               child: Container(
//                 padding: const EdgeInsets.all(12),
//                 decoration: BoxDecoration(
//                   color: brandPrimaryColor,
//                   borderRadius: BorderRadius.circular(8),
//                   border: Border.all(color: Colors.grey[400]!),
//                 ),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   children: [
//                     Icon(Icons.add_box_outlined, color: Colors.white),
//                     SizedBox(width: 10),
//                     Text('ADD NEW ITEM',
//                         style: TextStyle(
//                             fontFamily: 'JosefinSans',
//                             fontSize: 16,
//                             fontWeight: FontWeight.bold,
//                             color: Colors.white)),
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   Widget _buildTextField(String label, TextEditingController controller) {
//     return TextField(
//       controller: controller,
//       decoration: InputDecoration(
//         labelText: label,
//         border: OutlineInputBorder(),
//       ),
//     );
//   }
// }
class EstimateDetailsPage1 extends StatefulWidget {
  const EstimateDetailsPage1({super.key});

  @override
  State<EstimateDetailsPage1> createState() => _EstimateDetailsPage1State();
}

class _EstimateDetailsPage1State extends State<EstimateDetailsPage1> {
  bool isChangingAddress = false;
  int? selectedEmployeeId;

  double totalGram = 0;
  int totalAmount = 0;
  int oldGoldTotalAmount = 0;
  int netAmount = 0;

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
  void initState() {
    super.initState();
    calculateTotals();
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_sharp),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'ESTIMATE CREATION',
          style: TextStyle(
            fontFamily: 'JosefinSans',
            fontSize: 18,
            color: brandGreyColor,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            _buildCustomerInfo(),
            const SizedBox(height: 50),
            _buildNewJewellerySection(),
            const SizedBox(height: 30),
            if (!isChangingAddress)
              _buildActionButtons()
            else
              _buildOldGoldSection(),
          ],
        ),
      ),
    );
  }

  Widget _buildCustomerInfo() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Column(
          children: [
            Text('Customer', style: tag2),
            Text('Santhosh', style: tag1),
          ],
        ),
        const SizedBox(width: 140),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Contact', style: tag2),
              Text('9876543210', style: tag1),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildNewJewellerySection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('NEW JEWELLERY', style: tag3),
        const SizedBox(height: 30),
        ...carratDetails.map((item) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 5),
            child: Row(
              children: [
                SizedBox(
                  width: 180,
                  child:
                      Text('${item['name']} | ${item['carrat']}', style: tag2),
                ),
                SizedBox(width: 80, child: Text(item['gram'], style: tag2)),
                SizedBox(
                    width: 70, child: Text('₹${item['amount']}', style: tag2)),
                IconButton(
                  icon: Icon(item['icon']),
                  onPressed: () {
                    setState(() {
                      carratDetails.remove(item);
                      calculateTotals(); // Recalculate totals after removal
                    });
                  },
                ),
              ],
            ),
          );
        }),
        const Divider(color: brandGreyColor),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Row(
            children: [
              SizedBox(width: 180, child: Text('Total', style: tag1)),
              SizedBox(
                  width: 80,
                  child: Text('${totalGram.toStringAsFixed(1)}g', style: tag1)),
              SizedBox(width: 100, child: Text('₹$totalAmount', style: tag1)),
            ],
          ),
        ),
        const SizedBox(height: 20),
        Text('OLD GOLD', style: tag3),
      ],
    );
  }

  Widget _buildOldGoldSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ...oldDetails.map((item) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 1),
            child: Row(
              children: [
                SizedBox(
                  width: 180,
                  child:
                      Text('${item['name']} | ${item['carrat']}', style: tag2),
                ),
                SizedBox(width: 80, child: Text(item['gram'], style: tag2)),
                SizedBox(
                    width: 70, child: Text('-₹${item['amount']}', style: tag1)),
                IconButton(
                  icon: Icon(item['icon']),
                  onPressed: () {
                    setState(() {
                      oldDetails.remove(item);
                      calculateTotals(); // Recalculate totals after removal
                    });
                  },
                ),
              ],
            ),
          );
        }),
        const Divider(color: brandGreyColor),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            SizedBox(width: 100, child: Text('Total', style: tag1)),
            SizedBox(width: 115, child: Text('₹$netAmount', style: tag1)),
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
          children: [
            GestureDetector(
              onTap: () {
                setState(() {
                  isChangingAddress = !isChangingAddress;
                });
              },
              child: Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  color: brandPrimaryColor,
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.add, size: 30, color: Colors.white),
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: GestureDetector(
                onTap: () {
                  // Add your print and approve logic here
                },
                child: Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: brandGoldColor),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(Icons.add_box_outlined, color: brandGoldColor),
                      SizedBox(width: 8),
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
    );
  }

  Widget _buildActionButtons() {
    return Column(
      children: [
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: () {
                Get.to(ScanPages());
              },
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
                  Get.to(ScanPages());
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
        const SizedBox(height: 10),
        Row(
          children: [
            Expanded(
              child: GestureDetector(
                onTap: () => Get.to(NewGoldScreen()),
                child: _buildActionCard('NEW ITEM', Colors.white),
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: GestureDetector(
                onTap: () => Get.to(OldGoldScreen()),
                child: _buildActionCard('OLD GOLD', Colors.amber[50]!,
                    borderColor: brandGoldColor),
              ),
            ),
          ],
        ),
        const SizedBox(height: 20),
        GestureDetector(
          onTap: () {
            setState(() {
              isChangingAddress = !isChangingAddress;
            });
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
              children: const [
                Icon(Icons.add_box_outlined, color: Colors.white),
                SizedBox(width: 10),
                Text(
                  'ADD NEW ITEM',
                  style: TextStyle(
                    fontFamily: 'JosefinSans',
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildActionCard(String title, Color color, {Color? borderColor}) {
    return Container(
      height: 80,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: borderColor ?? Colors.grey[400]!),
      ),
      child: Center(
        child: Text(
          title,
          style: const TextStyle(
            fontFamily: 'JosefinSans',
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
