import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tn_jewellery_admin/features/signIn/LoginScreen.dart';
import 'package:tn_jewellery_admin/features/splash/splash_screen.dart';
import 'package:tn_jewellery_admin/utils/config.dart';

import '../../../common/update_screen.dart';
import '../../../features/splash/controller/splash_controller.dart';

class RouteHelper {
  static const String initial = '/';
  static const String splash = '/splash';
  static const String signIn = '/onboardscreen';
  static const String language = '/language';
  static const String signUp = '/sign-up';
  static const String signUpEstablish = '/sign-up-establish';
  static const String addLocation = '/add-location';
  static const String onBoardScreen = '/onboard-screen';
  static const String otpVerifyScreen = '/otpVerifyScreen';
  static const String dashboardscreen = '/dashboardscreen';
  static const String profilescreen = '/profilescreen';
  static const String editprofilescreen = '/editprofilescreen';

  static const String riderhistoryscreen = '/riderhistoryscreen';
  static const String ridecompletedetails = '/ridecompletedetails';
  static const String choosemapscreen = '/choosemapscreen';
  static const String bookingscreen = '/booking screen';
  static const String ridecompletedscreen = '/ridecompletedscreen';
  static const String userinfoscreen = '/userinfoscreen';
  static const String customercarescreen = '/customercarescreen';
  static const String notificationcreen = '/notificationscreen';

  static String getInitialRoute() => initial;
  static String getSplashRoute() => splash;
  static String getLanguageRoute(String page) => '$language?page=$page';
  static String getSignInRoute() => onBoardScreen;
  static String getOtpVerifyRoute() => otpVerifyScreen;
  static String getDashBoardRoute() => dashboardscreen;
  static String getProfileRoute() => profilescreen;
  static String getEditProfileRoute() => editprofilescreen;
  static String getRiderHistoryRoute() => riderhistoryscreen;
  static String getRideCompleteDetailsRoute() => ridecompletedetails;
  static String getChooseMapRoute() => choosemapscreen;
  static String getBookingRoute() => bookingscreen;
  static String getRideCompleteRoute() => ridecompletedscreen;
  static String getUserInfoRoute() => userinfoscreen;
  static String getCustomerCareRoute() => customercarescreen;
  static String getNotificationRoute() => notificationcreen;

  static String getAddLocation(int id, int accountId) =>
      '$addLocation?userId=$id&accountId=$accountId';

  static List<GetPage> routes = [
    GetPage(name: splash, page: () => const SplashScreen()),
    GetPage(name: onBoardScreen, page: () => getRoute(const LoginScreen())),
    // GetPage(name: otpVerifyScreen, page: () => getRoute(const Otpverifyscreen())),
    // GetPage(name: dashboardscreen, page: () => getRoute(const Dashboardscreen())),
    // GetPage(name: profilescreen, page: () => getRoute(const ProfileScreen())),
    // GetPage(name: riderhistoryscreen, page: () => getRoute(const RiderHistoryScreen())),
    // GetPage(name: editprofilescreen, page: () => getRoute(const EditProfileScreen())),
    // GetPage(name: ridecompletedetails, page: () => getRoute(const RideCompleteDetails())),
    // GetPage(name: choosemapscreen, page: () => getRoute(const Choose_Mapscreen(),)),
    // GetPage(name: bookingscreen, page: () => getRoute(const BookingScreen())),
    // GetPage(name: ridecompletedscreen, page: () => getRoute(const RideCompletedScreen())),
    // GetPage(name: userinfoscreen, page: () => const UserInfoScreen()),
    // GetPage(name: customercarescreen, page: () => const CustomerCareScreen()),
    // GetPage(name: notificationcreen, page: () => const NotificationScreen()),
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
