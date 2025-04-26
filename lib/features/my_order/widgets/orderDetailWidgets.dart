import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tn_jewellery_admin/features/my_order/controller/order_controller.dart';
import 'package:tn_jewellery_admin/utils/colors.dart';
import 'package:tn_jewellery_admin/utils/core/helper/route_helper.dart';

Widget buildSelectButton() {
  return Center(
    child: SizedBox(
      width: 235,
      height: 50,
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          side: const BorderSide(color: buttonTextColor),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
        onPressed: () {
          Get.toNamed(RouteHelper.neworderScreen);
        },
        child: const Text('SELECT KARIKAR',
            style: TextStyle(
                fontFamily: 'JosefinSans',
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: brandGoldColor)),
      ),
    ),
  );
}

Widget buildChangeStatus(OrderController controller) {
  return Center(
    child: SizedBox(
      width: 235,
      height: 50,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: brandGoldColor,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
        onPressed: () async {
          var body = {
            "cancel_reason": "Any",
            "detail_id": "${controller.selectNewOrderListData?.detailId ?? 0}",
            "id_job_order_detail": "",
            "status": 7
          };

          await controller.OrderCancelStatus(body: body);
          Navigator.pop(Get.context!, true);
        },
        child: const Text('CHANGE STATUS',
            style: TextStyle(
                fontFamily: 'JosefinSans',
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: secondaryColor)),
      ),
    ),
  );
}
