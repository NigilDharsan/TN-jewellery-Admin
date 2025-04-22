import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tn_jewellery_admin/features/my_order/controller/order_controller.dart';
import 'package:tn_jewellery_admin/features/my_order/widgets/myOrderWidgets.dart';
import 'package:tn_jewellery_admin/utils/widgets/custom_app_bar.dart';

class myOrderScreen extends StatefulWidget {
  const myOrderScreen({super.key});

  @override
  State<myOrderScreen> createState() => _myOrderScreenState();
}

class _myOrderScreenState extends State<myOrderScreen> {
  bool isNewOrdersSelected = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(50),
          child: CustomAppBar(
            title: 'CUSTOM ORDERS',
            isBackButtonExist: false,
          )),
      body: GetBuilder<OrderController>(
          initState: (state) => Get.find<OrderController>().getNewOrderList(),
          builder: (controller) {
            return controller.isLoading
                ? const Center(child: CircularProgressIndicator())
                : buildOrderList(controller);
          }),
    );
  }
}

Widget buildOrderList(OrderController controller) {
  return Padding(
    padding: const EdgeInsets.all(20),
    child: Column(
      children: [
        Row(
          children: [
            Expanded(
              child: buildTabButton(
                  "NEW ORDERS", controller.isNewOrdersSelected, () {
                controller.isNewOrdersSelected = true;
                controller.update();
              }),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: buildTabButton(
                  "ORDER STATUS", !controller.isNewOrdersSelected, () {
                controller.isNewOrdersSelected = true;
                controller.update();
              }),
            ),
          ],
        ),
        const SizedBox(height: 20),
        Expanded(
          child: controller.isNewOrdersSelected
              ? ListView.separated(
                  itemCount: 0,
                  separatorBuilder: (_, __) => const SizedBox(height: 12),
                  itemBuilder: (context, index) {
                    return buildOrderCard();
                  },
                )
              : ListView.separated(
                  itemCount: 9,
                  separatorBuilder: (_, __) => const SizedBox(height: 12),
                  itemBuilder: (context, index) {
                    return buildOrderCard();
                  },
                ),
        ),
      ],
    ),
  );
}
