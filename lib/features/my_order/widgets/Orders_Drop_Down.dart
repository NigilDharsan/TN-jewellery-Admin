import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tn_jewellery_admin/features/dashboard/controller/dashboard_controller.dart';
import 'package:tn_jewellery_admin/features/my_order/controller/order_controller.dart';
import 'package:tn_jewellery_admin/utils/colors.dart';

class OrdersDropDown extends StatefulWidget {
  const OrdersDropDown({super.key});

  @override
  State<OrdersDropDown> createState() => _OrdersDropDownState();
}

class _OrdersDropDownState extends State<OrdersDropDown> {
  final TextEditingController _searchController = TextEditingController();

  List<dynamic> filteredList = [];

  @override
  void initState() {
    super.initState();
    _searchController.addListener(_filterList);
  }

  void _filterList() {
    final query = _searchController.text.toLowerCase();
    final orderController = Get.find<OrderController>();
    final dashboardController = Get.find<DashboardController>();

    setState(() {
      if (orderController.selectedWorkStatus == "In Progress") {
        final originalList = orderController.supplierListModel?.data ?? [];
        filteredList = originalList
            .where((item) =>
                (item.supplierName?.toLowerCase().contains(query) ?? false) ||
                (item.mobileNo?.toLowerCase().contains(query) ?? false))
            .toList();
      } else {
        final originalList = dashboardController.customerModel?.data ?? [];
        filteredList = originalList
            .where((item) =>
                (item.name?.toLowerCase().contains(query) ?? false) ||
                (item.mobile?.toLowerCase().contains(query) ?? false))
            .toList();
      }
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Search Karikar',
          style: TextStyle(
            fontFamily: 'JosefinSans',
            fontWeight: FontWeight.bold,
            color: brandPrimaryColor,
            fontSize: 18,
          ),
        ),
      ),
      body: GetBuilder<OrderController>(
        autoRemove: false,
        builder: (controller) {
          return buildSearchBar(controller);
        },
      ),
    );
  }

  buildSearchBar(OrderController controller) {
    final isInProgress = controller.selectedWorkStatus == "In Progress";
    final originalList = isInProgress
        ? controller.supplierListModel?.data ?? []
        : Get.find<DashboardController>().customerModel?.data ?? [];

    // If search is empty, show full list; else show filtered list
    final displayList =
        _searchController.text.isEmpty ? originalList : filteredList;

    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          TextFormField(
            controller: _searchController,
            decoration: InputDecoration(
              hintText: 'Search by name or mobile number',
              prefixIcon: const Icon(Icons.search),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: brandGoldColor),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: brandGoldColor, width: 2),
              ),
            ),
          ),
          const SizedBox(height: 10),
          Expanded(
            child: ListView.builder(
              itemCount: displayList.length,
              itemBuilder: (context, index) {
                final item = displayList[index];
                return GestureDetector(
                  onTap: () {
                    Get.back(
                      result: isInProgress
                          ? item.supplierName ?? ""
                          : item.name ?? "",
                    );
                  },
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    elevation: 3,
                    margin: const EdgeInsets.symmetric(vertical: 6),
                    child: ListTile(
                      leading: const Icon(Icons.person),
                      title: Text(
                        isInProgress
                            ? item.supplierName ?? ""
                            : item.name ?? "",
                      ),
                      subtitle: Text(
                        isInProgress ? item.mobileNo ?? "" : item.mobile ?? "",
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
