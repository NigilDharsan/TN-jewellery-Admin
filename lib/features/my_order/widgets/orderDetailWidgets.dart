import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tn_jewellery_admin/features/my_order/controller/order_controller.dart';
import 'package:tn_jewellery_admin/utils/colors.dart';

Widget buildSelectButton(OrderController controller) {
  return Center(
    child: SizedBox(
      width: 235,
      height: 50,
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          side: const BorderSide(color: buttonTextColor),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
        onPressed: () async {
          var body = {
            "process_type":"1", //1-Approve,2-CAD Issue,3-CAD Completed,4-CAM Issue,5-CAM Completed,6-Production Issue,7-Production Completed
            "added_through": 2,  //constant
            "order_detail_ids":[
                {
                    "detail_id": "${controller.selectNewOrderListData?.detailId ?? 0}",
                    "remarks":"Order confirmed"
                }
            ]
        };
          await controller.OrderUpdateStatus(body: body);
          Navigator.pop(Get.context!, true);
        },
        child: const Text('APPROVE',
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
            "process_type":"9", //1-Approve,2-CAD Issue,3-CAD Completed,4-CAM Issue,5-CAM Completed,6-Production Issue,7-Production Completed
            "added_through": 2,  //constant
            "order_detail_ids":[
                {
                    "detail_id": "${controller.selectNewOrderListData?.detailId ?? 0}",
                    "remarks":"Order Rejected"
                }
            ]
        };
          await controller.OrderUpdateStatus(body: body);
          Navigator.pop(Get.context!, true);
        },
        child: const Text('REJECT',
            style: TextStyle(
                fontFamily: 'JosefinSans',
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: secondaryColor)),
      ),
    ),
  );
}
