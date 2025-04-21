import 'package:flutter/material.dart';
import 'package:tn_jewellery_admin/features/my_order/widgets/myOrderWidgets.dart';
import 'package:tn_jewellery_admin/utils/widgets/custom_app_bar.dart';


class myOrderScreen extends StatefulWidget {
  const myOrderScreen({super.key});

  @override
  State<myOrderScreen> createState() => _myOrderScreenState();
}

class _myOrderScreenState extends State<myOrderScreen> {
  bool isNewOrdersSelected = true;

  final List<Map<String, String>> orders = [
    {
      "image":
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTSZ8b6qsJACPFXvkLvfOBtn-suzr47aiB9iA&s",
      "name": "Raja Jewellery",
      "product": "Ring",
      "gram": "10g",
      "percentage": "96.8%",
      "status": "ASSIGN NOW"
    },
    {
      "image":
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTSZ8b6qsJACPFXvkLvfOBtn-suzr47aiB9iA&s",
      "name": "Raja Jewellery",
      "product": "Ring",
      "gram": "10g",
      "percentage": "96.8%",
      "status": "ASSIGN NOW"
    },
    {
      "image":
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTSZ8b6qsJACPFXvkLvfOBtn-suzr47aiB9iA&s",
      "name": "Raja Jewellery",
      "product": "Ring",
      "gram": "10g",
      "percentage": "96.8%",
      "status": "ASSIGN NOW"
    },
    // More sample data...
  ];
  @override
  Widget build(BuildContext context) {
    List<Map<String, String>> filteredOrders = isNewOrdersSelected
        ? orders
        : orders.where((order) => order["status"] != "ASSIGN NOW").toList();
    return Scaffold(
      appBar: PreferredSize(preferredSize: Size.fromHeight(50),
          child: CustomAppBar(
            title: 'CUSTOM ORDERS',
            isBackButtonExist: true,
          )),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: buildTabButton("NEW ORDERS", isNewOrdersSelected, () {
                    setState(() => isNewOrdersSelected = true);
                  }),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: buildTabButton("ORDER STATUS", !isNewOrdersSelected, () {
                    setState(() => isNewOrdersSelected = false);
                  }),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Expanded(
              child: isNewOrdersSelected
                  ? ListView.separated(
                itemCount: filteredOrders.length,
                separatorBuilder: (_, __) => const SizedBox(height: 12),
                itemBuilder: (context, index) {
                  return buildOrderCard(filteredOrders[index]);
                },
              )
                  : ListView.separated(
                itemCount: filteredOrders.length,
                separatorBuilder: (_, __) => const SizedBox(height: 12),
                itemBuilder: (context, index) {
                  return buildOrderCard(filteredOrders[index]);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
