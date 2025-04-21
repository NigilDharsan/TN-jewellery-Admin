import 'package:flutter/material.dart';
import 'package:tn_jewellery_admin/features/dashboard/widgets/widgets.dart';
import 'package:tn_jewellery_admin/utils/colors.dart';
import 'package:tn_jewellery_admin/utils/styles.dart';

class dashboardScreen extends StatefulWidget {
  const dashboardScreen({super.key});

  @override
  State<dashboardScreen> createState() => _dashboardScreenState();
}

class _dashboardScreenState extends State<dashboardScreen> {
  int _selectedTabIndex = 0;
  int _selectedPageIndex = 2; // Default to STOCK tab

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }
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
                Icon(Icons.menu, color: brandGoldColor, size: 30),
                const SizedBox(width: 15),
                Text('Welcome', style: order_style2),
                const SizedBox(width: 10),
                Text('TN JEWELLERY', style: jewellery_style),
              ],
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildTabbedContainer(),
              const SizedBox(height: 10),
              buildBottomButtons(),
              const SizedBox(height: 20),
              buildTotalSalesButton(),
              const SizedBox(height: 15),
              buildWardButtons(),
              const SizedBox(height: 10),
              buildApprovedButtons(),
              const SizedBox(height: 10),
              // buildSelectButtons(),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildTabbedContainer() {
    return Column(
      children: [
        Stack(
          children: [
            Row(
              children: [
                Expanded(
                  child:
                  buildTabButton("GOLD RATE", _selectedTabIndex == 0, () {
                    setState(() => _selectedTabIndex = 0);
                  }),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child:
                  buildTabButton("SILVER RATE", _selectedTabIndex == 1, () {
                    setState(() => _selectedTabIndex = 1);
                  }),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: buildTabButton("ORDER STATUS", _selectedTabIndex == 2,
                          () {
                        setState(() => _selectedTabIndex = 2);
                      }),
                ),
              ],
            ),
          ],
        ),
        if (_selectedTabIndex == 0) // Gold Rate
          ClipPath(
            clipper: GoldRateClipper(),
            child: Container(
              height: 120,
              decoration: BoxDecoration(
                color: Color(0xFFD2922A),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    buildRateColumn('18K', '7550'),
                    buildRateColumn('20K', '8250'),
                    buildRateColumn('22K', '8350'),
                    buildRateColumn('24K', '8750'),
                  ],
                ),
              ),
            ),
          )
        else if (_selectedTabIndex == 1) // Silver Rate
          ClipPath(
            clipper: GoldRateClipper(),
            child: Container(
              height: 120,
              decoration: const BoxDecoration(
                color: Color(0xFFD2922A),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    buildRateColumn('18K', '7550'),
                    buildRateColumn('19K', '8250'),
                    buildRateColumn('20K', '9350'),
                    buildRateColumn('21K', '10050'),
                  ],
                ),
              ),
            ),
          )
        else // Order Status
          ClipPath(
            clipper: GoldRateClipper(),
            child: Container(
              height: 120,
              decoration: const BoxDecoration(
                color: Color(0xFFD2922A),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    buildRateColumn('38K', '17550'),
                    buildRateColumn('20K', '28250'),
                    buildRateColumn('42K', '38350'),
                    buildRateColumn('54K', '48750'),
                  ],
                ),
              ),
            ),
          ),
      ],
    );
  }
}

class GoldRateClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();

    path.moveTo(0, 0);
    path.quadraticBezierTo(0, 0, 0, 0); // Top-left corner

    path.lineTo(size.width - 20, 0);
    path.quadraticBezierTo(size.width, 0, size.width, 20); // Top-right corner

    path.lineTo(size.width, size.height - 20);
    path.quadraticBezierTo(size.width, size.height, size.width - 20, size.height); // Bottom-right corner

    path.lineTo(20, size.height);
    path.quadraticBezierTo(0, size.height, 0, size.height - 20); // Bottom-left corner

    path.close(); // Close the path

    return path;
  }


  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}