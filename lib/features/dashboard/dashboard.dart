import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tn_jewellery_admin/features/dashboard/controller/dashboard_controller.dart';
import 'package:tn_jewellery_admin/features/my_order/controller/order_controller.dart';
import 'package:tn_jewellery_admin/utils/colors.dart';
import 'package:tn_jewellery_admin/utils/core/helper/route_helper.dart';
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
                      color: brandGoldDarkColor,
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
                            color: brandPrimaryColor,
                            borderRadius: const BorderRadius.vertical(
                                top: Radius.circular(8)),
                          ),
                          child: const Text(
                            'Customers Approvals',
                            style: TextStyle(
                              fontFamily: 'JosefinSans',
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
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
                                  'Total Approved',
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
                                  'Yet to Approve',
                                  controller.dashboardModel?.data
                                          ?.yetToApproveCustomers
                                          .toString() ??
                                      ""),
                              InkWell(
                                onTap: () => Get.offAllNamed(
                                    RouteHelper.getMainRoute("1")),
                                child: CircleAvatar(
                                  backgroundColor: Colors.white,
                                  child: const Icon(Icons.arrow_forward,
                                      color: brandPrimaryColor),
                                ),
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
            buildApprovedButtons(controller),
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
              color: Colors.white,
              fontFamily: 'JosefinSans',
              fontWeight: FontWeight.w800)),
      const SizedBox(height: 4),
      Text(value,
          style: const TextStyle(
              color: Colors.white,
              fontFamily: 'JosefinSans',
              fontSize: 20,
              fontWeight: FontWeight.w900)),
    ],
  );
}

Widget buildApprovedButtons(DashboardController controller) {
  return Column(
    children: [
      Row(
        children: [
          Expanded(
            child: buildApprovalCard(
              title: 'Yet To Assign',
              subtitle: '',
              badgeCount: controller
                      .dashboardModel?.data?.nonAssignedOrdersCount
                      .toString() ??
                  "",
              color: brandPrimaryColor,
              onTap: () {
                // Handle tap
                Get.offAllNamed(RouteHelper.getMainRoute("2"));
              },
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: buildApprovalCard(
              title: 'Work in Progress',
              subtitle: '',
              badgeCount: controller
                      .dashboardModel?.data?.workInProgressOrdersCount
                      .toString() ??
                  "",
              color: brandGreySoftColor,
              onTap: () {
                Get.find<OrderController>().selectedWorkStatus = "In Progress";
                Get.find<OrderController>().selectedWorkStatusID = "inprogress";

                Get.find<OrderController>().isNewOrdersSelected = false;

                Get.offAllNamed(RouteHelper.getMainRoute("2"));
              },
            ),
          ),
        ],
      ),
      SizedBox(height: 20),
      Row(
        children: [
          Expanded(
            child: buildApprovalCard(
              title: 'Delivery Ready',
              subtitle: '',
              badgeCount: controller
                      .dashboardModel?.data?.deliveryReadyOrdersCount
                      .toString() ??
                  "",
              color: brandGreySoftColor,
              onTap: () {
                Get.find<OrderController>().selectedWorkStatus =
                    "Delivery Ready";
                Get.find<OrderController>().selectedWorkStatusID =
                    "delivery_ready";

                Get.find<OrderController>().isNewOrdersSelected = false;
                Get.offAllNamed(RouteHelper.getMainRoute("2"));
              },
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: buildApprovalCard(
              title: 'Over Due Orders',
              subtitle: '',
              badgeCount: controller.dashboardModel?.data?.overdueOrdersCount
                      .toString() ??
                  "",
              color: brandGoldColor,
              onTap: () {
                // Handle tap
                Get.find<OrderController>().selectedWorkStatus = "In Progress";
                Get.find<OrderController>().selectedWorkStatusID = "inprogress";

                Get.find<OrderController>().isNewOrdersSelected = false;

                Get.offAllNamed(RouteHelper.getMainRoute("2"));
              },
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
  required String badgeCount,
  required Function()? onTap,
  required Color color,
}) {
  return Stack(
    clipBehavior: Clip.none,
    children: [
      InkWell(
        onTap: onTap,
        child: Container(
          height: 100,
          padding:
              const EdgeInsets.only(top: 20, left: 10, right: 10, bottom: 10),
          decoration: BoxDecoration(
            color: color, // Use your desired color or brandGreySoftColor
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
                    fontWeight: FontWeight.w700,
                    color: Colors.white, // Use secondaryColor if defined
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
      ),
      Positioned(
        right: 15,
        top: -10,
        child: CircleAvatar(
          radius: 15,
          backgroundColor: brandGreyColor, // Use brandPrimaryColor if defined
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