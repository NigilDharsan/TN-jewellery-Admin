import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tn_jewellery_admin/features/auth/signIn/LoginScreen.dart';
import 'package:tn_jewellery_admin/features/dashboard/dashboard.dart';
import 'package:tn_jewellery_admin/features/landing/landing_screen.dart';
import 'package:tn_jewellery_admin/features/my_order/myOrderScreen.dart'
    show myOrderScreen;
import 'package:tn_jewellery_admin/features/my_order/newOrderScreen.dart'
    show newOrderScreen;
import 'package:tn_jewellery_admin/features/my_order/orderDetailScreen.dart'
    show orderDetailScreen;
import 'package:tn_jewellery_admin/features/splash/splash_screen.dart';
import 'package:tn_jewellery_admin/features/tagSearch/TagSearchScreen.dart';
import 'package:tn_jewellery_admin/features/tagSearch/TagWithoutImageList.dart';
import 'package:tn_jewellery_admin/utils/config.dart';

import '../../../common/update_screen.dart';
import '../../../features/splash/controller/splash_controller.dart';

class RouteHelper {
  static const String initial = '/';
  static const String splash = '/splash';
  static const String signIn = '/onboardscreen';
  static const String language = '/language';
  static const String main = '/main';
  static const String signUp = '/sign-up';
  static const String signUpEstablish = '/sign-up-establish';
  static const String addLocation = '/add-location';
  static const String onBoardScreen = '/onboard-screen';
  static const String otpVerifyScreen = '/otpVerifyScreen';
  static const String dashboardscreen = '/dashboardscreen';
  static const String myorderScreen = '/myOrderScreen';
  static const String orderdetailScreen = '/orderDetailScreen';
  static const String neworderScreen = '/newOrderScreen';
  static const String tagsearchscreen = '/tagsearchscreen';
  static const String tagwithoutimagescreen = '/tagwithoutimagescreen';

  static String getInitialRoute() => initial;
  static String getSplashRoute() => splash;
  static String getLanguageRoute(String page) => '$language?page=$page';
  static String getMainRoute(String page) => '$main?page=$page';
  static String getSignInRoute() => onBoardScreen;
  static String getOtpVerifyRoute() => otpVerifyScreen;
  static String getDashBoardRoute() => dashboardscreen;
  static String getMyOrderScreen() => myorderScreen;
  static String getOrderDetailsScreen() => orderdetailScreen;
  static String getNewOrderScreen() => neworderScreen;
  static String getTagSearchScreen() => tagsearchscreen;
  static String getTagWithoutImageScreen() => tagwithoutimagescreen;

  static String getAddLocation(int id, int accountId) =>
      '$addLocation?userId=$id&accountId=$accountId';

  static List<GetPage> routes = [
    GetPage(name: splash, page: () => const SplashScreen()),
    GetPage(name: onBoardScreen, page: () => getRoute(const LoginScreen())),
    GetPage(name: dashboardscreen, page: () => const dashboardScreen()),
    GetPage(name: myorderScreen, page: () => const myOrderScreen()),
    GetPage(name: orderdetailScreen, page: () => const orderDetailScreen()),
    GetPage(name: neworderScreen, page: () => const newOrderScreen()),
    GetPage(name: tagsearchscreen, page: () => TagSearchScreen()),
    GetPage(name: tagwithoutimagescreen, page: () => TagWithoutImageList()),
    GetPage(
      name: main,
      page: () {
        final pageParam = Get.parameters['page'] ?? '0';
        final pageIndex = int.tryParse(pageParam) ?? 0;
        return MainScreen(pageIndex: pageIndex);
      },
    ),
  ];

  static getRoute(Widget navigateTo) {
    double minimumVersion = 1;
    if (Get.find<SplashController>().configModel.data != null) {
      if (GetPlatform.isAndroid) {
        minimumVersion = double.parse(Get.find<SplashController>()
            .configModel
            .data!
            .androidVersion
            .latestApkVersion);
      } else if (GetPlatform.isIOS) {
        minimumVersion = double.parse(Get.find<SplashController>()
            .configModel
            .data!
            .iosVersion
            .latestIpaVersion);
      }
    }
    return Config.appVersion < minimumVersion
        ? const UpdateScreen(isUpdate: true)
        : navigateTo;
  }
}
