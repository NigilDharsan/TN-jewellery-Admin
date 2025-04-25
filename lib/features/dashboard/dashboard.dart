import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tn_jewellery_admin/features/dashboard/controller/dashboard_controller.dart';
import 'package:tn_jewellery_admin/utils/styles.dart';

class dashboardScreen extends StatefulWidget {
  const dashboardScreen({super.key});

  @override
  State<dashboardScreen> createState() => _dashboardScreenState();
}

class _dashboardScreenState extends State<dashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          iconTheme: const IconThemeData(color: Colors.black),
          automaticallyImplyLeading: false,
          toolbarHeight: 50,
          title: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const SizedBox(width: 15),
                  Text('Welcome', style: order_style2),
                  const SizedBox(width: 10),
                  Text('TN JEWELLERY', style: jewellery_style),
                ],
              ),
            ],
          ),
        ),
        body: GetBuilder<DashboardController>(
          initState: (state) =>
              Get.find<DashboardController>().getDashboardData(),
          autoRemove: false,
          builder: (controller) {
            return controller.isLoading
                ? Container()
                : buildDashboardDetail(controller);
          },
        ));
  }

  Widget buildDashboardDetail(DashboardController controller) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(8),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 6,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: double.infinity,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 12, vertical: 8),
                          decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: const BorderRadius.vertical(
                                top: Radius.circular(8)),
                          ),
                          child: const Text(
                            'Customers Approvals',
                            style: TextStyle(
                              fontFamily: 'JosefinSans',
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                              fontSize: 16,
                            ),
                          ),
                        ),
                        const SizedBox(height: 5),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Customerbuild(
                                  'Total Approve',
                                  controller.dashboardModel?.data
                                          ?.approvedCustomers
                                          .toString() ??
                                      ""),
                              Customerbuild(
                                  'Rejected',
                                  controller.dashboardModel?.data
                                          ?.rejectedCustomers
                                          .toString() ??
                                      ""),
                            ],
                          ),
                        ),
                        const SizedBox(height: 12),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Customerbuild(
                                  'Yet & Approve',
                                  controller.dashboardModel?.data
                                          ?.yetToApproveCustomers
                                          .toString() ??
                                      ""),
                              CircleAvatar(
                                backgroundColor: Colors.grey[500],
                                child: const Icon(Icons.arrow_forward,
                                    color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            buildApprovedButtons(),
          ],
        ),
      ),
    );
  }
}

Widget Customerbuild(String label, String value) {
  return Column(
    children: [
      Text(label,
          style: const TextStyle(
              fontFamily: 'JosefinSans', fontWeight: FontWeight.w400)),
      const SizedBox(height: 4),
      Text(value,
          style: const TextStyle(
              fontFamily: 'JosefinSans',
              fontSize: 20,
              fontWeight: FontWeight.w900)),
    ],
  );
}

Widget buildApprovedButtons() {
  return Column(
    children: [
      Row(
        children: [
          Expanded(
            child: buildApprovalCard(
              title: 'YET',
              subtitle: 'Design',
              badgeCount: 10,
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: buildApprovalCard(
              title: 'Work',
              subtitle: 'Progress',
              badgeCount: 10,
            ),
          ),
        ],
      ),
      SizedBox(height: 20),
      Row(
        children: [
          Expanded(
            child: buildApprovalCard(
              title: 'Delivery',
              subtitle: 'Read',
              badgeCount: 5,
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: buildApprovalCard(
              title: 'Over Due',
              subtitle: 'orders',
              badgeCount: 2,
            ),
          ),
        ],
      ),
    ],
  );
}

Widget buildApprovalCard({
  required String title,
  required String subtitle,
  required int badgeCount,
}) {
  return Stack(
    clipBehavior: Clip.none,
    children: [
      Container(
        height: 100,
        padding:
            const EdgeInsets.only(top: 20, left: 10, right: 10, bottom: 10),
        decoration: BoxDecoration(
          color:
              Colors.grey[300], // Use your desired color or brandGreySoftColor
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Text(
                title,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontFamily: 'JosefinSans',
                  fontWeight: FontWeight.bold,
                  color: Colors.black, // Use secondaryColor if defined
                  fontSize: 12,
                ),
              ),
            ),
            const SizedBox(height: 4),
            Center(
              child: Text(
                subtitle,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontFamily: 'JosefinSans',
                  color: Colors.black, // Use secondaryColor if defined
                  fontSize: 12,
                ),
              ),
            ),
          ],
        ),
      ),
      Positioned(
        right: 15,
        top: -10,
        child: CircleAvatar(
          radius: 15,
          backgroundColor:
              Colors.blueAccent, // Use brandPrimaryColor if defined
          child: Text(
            '$badgeCount',
            style: const TextStyle(
              fontFamily: 'JosefinSans',
              color: Colors.white,
              fontSize: 12,
            ),
          ),
        ),
      ),
    ],
  );
}

// class dashboardScreen extends StatefulWidget {
//   const dashboardScreen({super.key});

//   @override
//   State<dashboardScreen> createState() => _dashboardScreenState();
// }

// class _dashboardScreenState extends State<dashboardScreen> {
//   int _selectedTabIndex = 0;
//   int _selectedPageIndex = 2; // Default to STOCK tab

//   void _selectPage(int index) {
//     setState(() {
//       _selectedPageIndex = index;
//     });
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         elevation: 0,
//         iconTheme: const IconThemeData(color: Colors.black),
//         automaticallyImplyLeading: false,
//         toolbarHeight: 50,
//         title: Row(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Row(
//               children: [
//                 Icon(Icons.menu, color: brandGoldColor, size: 30),
//                 const SizedBox(width: 15),
//                 Text('Welcome', style: order_style2),
//                 const SizedBox(width: 10),
//                 Text('TN JEWELLERY', style: jewellery_style),
//               ],
//             ),
//           ],
//         ),
//       ),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.all(20.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               buildTabbedContainer(),
//               const SizedBox(height: 10),
//               buildBottomButtons(),
//               const SizedBox(height: 20),
//               buildTotalSalesButton(),
//               const SizedBox(height: 15),
//               buildWardButtons(),
//               const SizedBox(height: 10),
//               buildApprovedButtons(),
//               const SizedBox(height: 10),
//               // buildSelectButtons(),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Widget buildTabbedContainer() {
//     return Column(
//       children: [
//         Stack(
//           children: [
//             Row(
//               children: [
//                 Expanded(
//                   child:
//                   buildTabButton("GOLD RATE", _selectedTabIndex == 0, () {
//                     setState(() => _selectedTabIndex = 0);
//                   }),
//                 ),
//                 const SizedBox(width: 8),
//                 Expanded(
//                   child:
//                   buildTabButton("SILVER RATE", _selectedTabIndex == 1, () {
//                     setState(() => _selectedTabIndex = 1);
//                   }),
//                 ),
//                 const SizedBox(width: 8),
//                 Expanded(
//                   child: buildTabButton("ORDER STATUS", _selectedTabIndex == 2,
//                           () {
//                         setState(() => _selectedTabIndex = 2);
//                       }),
//                 ),
//               ],
//             ),
//           ],
//         ),
//         if (_selectedTabIndex == 0) // Gold Rate
//           ClipPath(
//             clipper: GoldRateClipper(),
//             child: Container(
//               height: 120,
//               decoration: BoxDecoration(
//                 color: Color(0xFFD2922A),
//               ),
//               child: Padding(
//                 padding: const EdgeInsets.all(16.0),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceAround,
//                   children: [
//                     buildRateColumn('18K', '7550'),
//                     buildRateColumn('20K', '8250'),
//                     buildRateColumn('22K', '8350'),
//                     buildRateColumn('24K', '8750'),
//                   ],
//                 ),
//               ),
//             ),
//           )
//         else if (_selectedTabIndex == 1) // Silver Rate
//           ClipPath(
//             clipper: GoldRateClipper(),
//             child: Container(
//               height: 120,
//               decoration: const BoxDecoration(
//                 color: Color(0xFFD2922A),
//               ),
//               child: Padding(
//                 padding: const EdgeInsets.all(16.0),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceAround,
//                   children: [
//                     buildRateColumn('18K', '7550'),
//                     buildRateColumn('19K', '8250'),
//                     buildRateColumn('20K', '9350'),
//                     buildRateColumn('21K', '10050'),
//                   ],
//                 ),
//               ),
//             ),
//           )
//         else // Order Status
//           ClipPath(
//             clipper: GoldRateClipper(),
//             child: Container(
//               height: 120,
//               decoration: const BoxDecoration(
//                 color: Color(0xFFD2922A),
//               ),
//               child: Padding(
//                 padding: const EdgeInsets.all(16.0),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceAround,
//                   children: [
//                     buildRateColumn('38K', '17550'),
//                     buildRateColumn('20K', '28250'),
//                     buildRateColumn('42K', '38350'),
//                     buildRateColumn('54K', '48750'),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//       ],
//     );
//   }
// }

// class GoldRateClipper extends CustomClipper<Path> {
//   @override
//   Path getClip(Size size) {
//     Path path = Path();

//     path.moveTo(0, 0);
//     path.quadraticBezierTo(0, 0, 0, 0); // Top-left corner

//     path.lineTo(size.width - 20, 0);
//     path.quadraticBezierTo(size.width, 0, size.width, 20); // Top-right corner

//     path.lineTo(size.width, size.height - 20);
//     path.quadraticBezierTo(size.width, size.height, size.width - 20, size.height); // Bottom-right corner

//     path.lineTo(20, size.height);
//     path.quadraticBezierTo(0, size.height, 0, size.height - 20); // Bottom-left corner

//     path.close(); // Close the path

//     return path;
//   }


//   @override
//   bool shouldReclip(CustomClipper<Path> oldClipper) => false;
// }