import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tn_jewellery_admin/utils/dimensions.dart' show Dimensions;

void customSnackBar(String? message, {bool isError = true}) {
  if (message != null && message.isNotEmpty) {
    Get.showSnackbar(GetSnackBar(
      backgroundColor: isError ? Colors.red : Colors.green,
      message: message,
      maxWidth: Get.width,
      duration: const Duration(seconds: 2),
      snackStyle: SnackStyle.FLOATING,
      margin: const EdgeInsets.all(Dimensions.paddingSizeSmall),
      borderRadius: Dimensions.radiusSmall,
      isDismissible: true,
      dismissDirection: DismissDirection.horizontal,
    ));
  }
}
