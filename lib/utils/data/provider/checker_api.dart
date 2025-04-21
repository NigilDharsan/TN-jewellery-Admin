import 'package:get/get.dart';
import 'package:tn_jewellery_admin/utils/widgets/custom_snackbar.dart' show customSnackBar;

class ApiChecker {
  static void checkApi(Response response) {
    if (response.statusCode != 200) {
      // Get.find<AuthController>().clearSharedData();
      // Get.offAllNamed(RouteHelper.getSignInRoute('splash'));
    } else {
      customSnackBar("${response.statusCode!}".tr);
    }
  }
}
