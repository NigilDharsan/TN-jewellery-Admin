import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tn_jewellery_admin/features/my_order/controller/order_controller.dart';
import 'package:tn_jewellery_admin/features/my_order/repository/order_repo.dart';
import 'package:tn_jewellery_admin/features/splash/controller/splash_controller.dart';
import 'package:tn_jewellery_admin/utils/Loader/LoaderController.dart'
    show LoaderController;
import 'package:tn_jewellery_admin/utils/core/theme/controller/theme_controller.dart'
    show ThemeController;

import '../../../features/auth/controller/auth_controller.dart';
import '../../../features/auth/repository/auth_repo.dart';
import '../../../features/splash/repository/splash_repo.dart';
import '../../config.dart';
import '../../data/provider/client_api.dart';

class InitialBinding extends Bindings {
  onInit() {
    initControllers();
  }

  @override
  void dependencies() async {
    //common controller
    Get.lazyPut(() => ThemeController(sharedPreferences: Get.find()));

    Get.lazyPut(() => SplashController(
        splashRepo:
            SplashRepo(apiClient: Get.find(), sharedPreferences: Get.find())));
    Get.lazyPut(() => AuthController(
        authRepo:
            AuthRepo(sharedPreferences: Get.find(), apiClient: Get.find())));

    Get.lazyPut(() => OrderController(
        orderRepo:
            OrderRepo(sharedPreferences: Get.find(), apiClient: Get.find())));
    // Get.lazyPut(() => SignalRServices());
    // Get.lazyPut(() => StatusController());
    // Get.lazyPut(() => InAppCallController(
    //     inAppCallRepo: InAppCallRepo(apiClient: Get.find())));
  }
}

Future<void> initControllers() async {
  Get.put(LoaderController());

  final sharedPreferences = await SharedPreferences.getInstance();
  Get.put<SharedPreferences>(sharedPreferences); // Register it in GetX

  Get.lazyPut(() => ThemeController(sharedPreferences: Get.find()));

  Get.lazyPut(() => SplashController(
      splashRepo:
          SplashRepo(apiClient: Get.find(), sharedPreferences: Get.find())));

  Get.lazyPut(() =>
      ApiClient(appBaseUrl: Config.baseUrl, sharedPreferences: Get.find()));
}
