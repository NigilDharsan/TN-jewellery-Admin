import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tn_jewellery_admin/features/auth/controller/auth_controller.dart';
import 'package:tn_jewellery_admin/features/customers/CustomerApprovals.dart';
import 'package:tn_jewellery_admin/features/dashboard/dashboard.dart';
import 'package:tn_jewellery_admin/features/my_order/myOrderScreen.dart';
import 'package:tn_jewellery_admin/utils/colors.dart';
import 'package:tn_jewellery_admin/utils/core/helper/route_helper.dart';

class MainScreen extends StatefulWidget {
  final int pageIndex;
  const MainScreen({Key? key, required this.pageIndex}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  late int _selectedPageIndex;

  @override
  void initState() {
    super.initState();
    _selectedPageIndex = widget.pageIndex; // Set default index from parameter
  }

  void _selectPage(int index) {
    if (index == 3) {
      _showLogoutConfirmation(context);
    } else {
      setState(() {
        _selectedPageIndex = index;
      });
    }
  }
  void _showLogoutConfirmation(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Logout",
              style: TextStyle(
                color: Colors.black,
                fontFamily: 'JosefinSans',
                fontSize: 14,
              )),
          content: Text("Are you sure you want to logout?",
              style: TextStyle(
                color: Colors.black,
                fontFamily: 'JosefinSans',
                fontSize: 14,
              )),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context); // Close the dialog
              },
              child: Text("Cancel",
                  style: TextStyle(
                    color: Colors.red,
                    fontFamily: 'JosefinSans',
                    fontSize: 15,
                  )),
            ),
            TextButton(
              onPressed: () {
                Get.find<AuthController>().clearSharedData();
                Navigator.pop(context); // Close the dialog
                Get.offAllNamed(RouteHelper.getSignInRoute());
              },
              child: Text("Yes",
                  style: TextStyle(
                    color: Colors.red,
                    fontFamily: 'JosefinSans',
                    fontSize: 15,
                  )),
            ),
          ],
        );
      },
    );
  }

  Widget _getScreen(int index) {
    switch (index) {
      case 0:
        return dashboardScreen();
      case 1:
        return CustomerNameList();
      case 2:
        return myOrderScreen();
      default:
        return dashboardScreen();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _getScreen(_selectedPageIndex),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.toNamed(RouteHelper.tagsearchscreen),
        backgroundColor: brandPrimaryColor,
        shape: const CircleBorder(),
        child: const Icon(Icons.add, size: 30, color: Colors.white),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        backgroundColor: brandGoldLightColor,
        currentIndex: _selectedPageIndex,
        selectedItemColor: brandPrimaryColor,
        unselectedItemColor: Colors.brown,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'HOME'),
          BottomNavigationBarItem(
              icon: Icon(Icons.verified), label: 'CUSTOMERS'),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart), label: 'ORDERS'),
          BottomNavigationBarItem(icon: Icon(Icons.logout_rounded), label: 'Logout'),
        ],
      ),
    );
  }

















// bool _doubleBackToExitPressedOnce = false;
  // PageController? _pageController;
  // int _currentIndex = 0;
  // late List<Widget> _screens;

  // @override
  // void initState() {
  //   _currentIndex = widget.pageIndex;

  //   _pageController = PageController(initialPage: widget.pageIndex);

  //   _screens = [
  //     dashboardScreen(),
  //     CustomerNameList(),
  //     myOrderScreen(),
  //     myOrderScreen(),
  //   ];
  //   super.initState();
  // }

  // @override
  // Widget build(BuildContext context) {
  //   return WillPopScope(
  //     onWillPop: () async {
  //       if (_currentIndex != 0) {
  //         _pageController!.jumpToPage(0);
  //         return false;
  //       } else {
  //         if (_doubleBackToExitPressedOnce) {
  //           return true;
  //         }
  //         _doubleBackToExitPressedOnce = true;
  //         ScaffoldMessenger.of(context).showSnackBar(SnackBar(
  //           content: Text('back_press_again_to_exit'.tr,
  //               style: const TextStyle(color: Colors.white)),
  //           behavior: SnackBarBehavior.floating,
  //           backgroundColor: Colors.amber,
  //           duration: const Duration(seconds: 2),
  //           margin: const EdgeInsets.all(Dimensions.paddingSizeSmall),
  //         ));
  //         // Reset the flag after 2 seconds
  //         Future.delayed(const Duration(seconds: 2), () {
  //           _doubleBackToExitPressedOnce = false;
  //         });

  //         return false;
  //       }
  //     },
  //     child: Scaffold(
  //       body: PageView.builder(
  //         controller: _pageController,
  //         onPageChanged: (index) {
  //           setState(() {
  //             _currentIndex = index;
  //           });
  //         },
  //         physics: const NeverScrollableScrollPhysics(),
  //         itemBuilder: (context, index) {
  //           return _screens[index];
  //         },
  //       ),
  //       bottomNavigationBar: BottomNavigationBar(
  //         currentIndex: _currentIndex,
  //         type: BottomNavigationBarType.fixed,
  //         selectedItemColor: brandPrimaryColor,
  //         unselectedItemColor: Colors.brown,
  //         selectedFontSize: 12,
  //         unselectedFontSize: 12,
  //         selectedLabelStyle: robotoMedium.copyWith(
  //           fontSize: Dimensions.fontSizeSmall,
  //           color:
  //               Get.isDarkMode ? Colors.green : Theme.of(context).primaryColor,
  //         ),
  //         unselectedLabelStyle: robotoMedium.copyWith(
  //             fontSize: Dimensions.fontSizeSmall,
  //             color: Theme.of(context).textTheme.bodyLarge!.color),
  //         elevation: 5.0,
  //         showSelectedLabels: true,
  //         showUnselectedLabels: true,
  //         onTap: (index) {
  //           setState(() {
  //             _currentIndex = index;
  //             _pageController!.jumpToPage(index);
  //           });
  //         },
  //         items: <BottomNavigationBarItem>[
  //           BottomNavigationBarItem(
  //             icon: Container(
  //               width: 105,
  //               padding: const EdgeInsets.symmetric(vertical: 15),
  //               decoration: BoxDecoration(
  //                 color: brandGreySoftColor,
  //                 borderRadius: BorderRadius.circular(0),
  //               ),
  //               child: Column(
  //                 mainAxisSize: MainAxisSize.min,
  //                 children: const [
  //                   Icon(Icons.home, color: Colors.black),
  //                   SizedBox(height: 4),
  //                   Text('Home',
  //                       style: TextStyle(
  //                           fontFamily: 'JosefinSans',
  //                           fontSize: 13,
  //                           color: Colors.black,
  //                           fontWeight: FontWeight.bold)),
  //                 ],
  //               ),
  //             ),
  //             label: '', // hide label outside
  //           ),
  //           BottomNavigationBarItem(
  //             icon: Container(
  //               width: 105,
  //               padding: const EdgeInsets.symmetric(vertical: 15),
  //               decoration: BoxDecoration(
  //                 color: brandGreySoftColor,
  //                 borderRadius: BorderRadius.circular(0),
  //               ),
  //               child: Column(
  //                 mainAxisSize: MainAxisSize.min,
  //                 children: const [
  //                   Icon(Icons.verified, color: Colors.black),
  //                   SizedBox(height: 4),
  //                   Text('Customers',
  //                       style: TextStyle(
  //                           fontFamily: 'JosefinSans',
  //                           fontSize: 13,
  //                           color: Colors.black,
  //                           fontWeight: FontWeight.bold)),
  //                 ],
  //               ),
  //             ),
  //             label: '',
  //           ),
  //           BottomNavigationBarItem(
  //             icon: Container(
  //               width: 105,
  //               padding: const EdgeInsets.symmetric(vertical: 15),
  //               decoration: BoxDecoration(
  //                 color: brandGreySoftColor,
  //                 borderRadius: BorderRadius.circular(0),
  //               ),
  //               child: Column(
  //                 mainAxisSize: MainAxisSize.min,
  //                 children: const [
  //                   Icon(Icons.shopping_cart, color: Colors.black),
  //                   SizedBox(height: 4),
  //                   Text('Orders',
  //                       style: TextStyle(
  //                           fontFamily: 'JosefinSans',
  //                           fontSize: 13,
  //                           color: Colors.black,
  //                           fontWeight: FontWeight.bold)),
  //                 ],
  //               ),
  //             ),
  //             label: '',
  //           ),
  //           BottomNavigationBarItem(
  //             icon: Container(
  //               width: 105,
  //               padding: const EdgeInsets.symmetric(vertical: 15),
  //               decoration: BoxDecoration(
  //                 color: brandGreySoftColor,
  //                 borderRadius: BorderRadius.circular(1),
  //               ),
  //               child: Column(
  //                 mainAxisSize: MainAxisSize.min,
  //                 children: const [
  //                   Icon(Icons.image, color: Colors.black),
  //                   SizedBox(height: 4),
  //                   Text('Images',
  //                       style: TextStyle(
  //                           fontFamily: 'JosefinSans',
  //                           fontSize: 13,
  //                           color: Colors.black,
  //                           fontWeight: FontWeight.bold)),
  //                 ],
  //               ),
  //             ),
  //             label: '',
  //           ),
  //         ],
  //       ),
  //     ),
  //   );
  // }
}
