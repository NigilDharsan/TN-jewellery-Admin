import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tn_jewellery_admin/features/my_order/controller/order_controller.dart';
import 'package:tn_jewellery_admin/features/my_order/widgets/myOrderWidgets.dart';
import 'package:tn_jewellery_admin/utils/colors.dart';
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
            return buildOrderList(controller);
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
                Get.find<OrderController>().getNewOrderList();
              }),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: buildTabButton(
                  "ORDER STATUS", !controller.isNewOrdersSelected, () {
                controller.isNewOrdersSelected = false;
                Get.find<OrderController>().getOrderStatusList("inprogress");
              }),
            ),
          ],
        ),
        const SizedBox(height: 20),
        controller.isLoading
            ? Container()
            : Expanded(
                child: controller.isNewOrdersSelected
                    ? ListView.separated(
                        itemCount: 0,
                        separatorBuilder: (_, __) => const SizedBox(height: 12),
                        itemBuilder: (context, index) {
                          return buildOrderCard();
                        },
                      )
                    : OrderStatusPage(),
              ),
      ],
    ),
  );
}

class OrderStatusPage extends StatefulWidget {
  const OrderStatusPage({super.key});

  @override
  State<OrderStatusPage> createState() => _OrderStatusPageState();
}

class _OrderStatusPageState extends State<OrderStatusPage> {
  int selectedIndex = 0; // Default selected button

  List<String> labels = ['CANCEL ORDER', 'COMPLETE STATUS'];
  List<Color> borderColors = [brandGoldColor, brandGoldColor];

  final List<Map<String, String>> orders = List.generate(5, (index) {
    return {
      'shopName': 'RAJA JEWELLERY',
      'status': 'Ring',
      'gram': '12g',
      'date': '2025-04-22',
    };
  });
  String? selectedWorkStatus;
  String? selectedVendor;

  final List<String> workStatusList = ['Status 1', 'Status 2', 'Status 3'];
  final List<String> vendorList = ['Vendor 1', 'Vendor 2', 'Vendor 3'];
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: workStatusDropdown(),
            ),
            SizedBox(width: 10),
            Expanded(
              child: vendorDropdown(),
            ),
            SizedBox(width: 10),
            Expanded(
              child: deliveryDateButton(),
            ),
          ],
        ),
        Expanded(
          child: ListView.separated(
            itemCount: orders.length,
            separatorBuilder: (_, __) => const SizedBox(height: 12),
            itemBuilder: (context, index) {
              return orderDetailsStatus(orders[index]);
            },
          ),
        )
      ],
    );
  }

  Widget workStatusDropdown() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade400),
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton2<String>(
          isExpanded: true,
          hint: const Text("Work Status",
              style: TextStyle(fontFamily: 'JosefinSans')),
          value: selectedWorkStatus,
          onChanged: (value) {
            setState(() {
              selectedWorkStatus = value;
            });
          },
          items: workStatusList.map((item) {
            return DropdownMenuItem<String>(
              value: item,
              child: Text(item),
            );
          }).toList(),
        ),
      ),
    );
  }

  Widget vendorDropdown() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade400),
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton2<String>(
          isExpanded: true,
          hint: const Text("Vendor Wise",
              style: TextStyle(fontFamily: 'JosefinSans')),
          value: selectedVendor,
          onChanged: (value) {
            setState(() {
              selectedVendor = value;
            });
          },
          items: vendorList.map((item) {
            return DropdownMenuItem<String>(
              value: item,
              child: Text(item),
            );
          }).toList(),
        ),
      ),
    );
  }

  Widget deliveryDateButton() {
    return GestureDetector(
      onTap: () async {
        final selectedDate = await showDatePicker(
          context: context,
          initialDate: DateTime.now(),
          firstDate: DateTime(2020),
          lastDate: DateTime(2030),
        );

        if (selectedDate != null) {
          print("Selected Delivery Date: $selectedDate");
        }
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.grey.shade400),
        ),
        child: const Text(
          "Delivery Date",
          style: TextStyle(
            fontFamily: 'JosefinSans',
            fontSize: 16,
            color: Colors.black87,
          ),
        ),
      ),
    );
  }

  Widget orderDetailsStatus(Map<String, String> order) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: EdgeInsets.all(2), // Space between avatar and border
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: white8, width: 1),
                ),
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 24,
                  child: Icon(Icons.shopping_cart, color: Colors.black),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(order['shopName'] ?? '',
                        style: const TextStyle(
                            fontFamily: 'JosefinSans',
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: textColor)),
                    const SizedBox(height: 4),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '${order['status']}',
                          style: TextStyle(
                              fontFamily: 'JosefinSans',
                              fontWeight: FontWeight.w500,
                              color: brandGreyColor),
                        ),
                        Text(' ${order['gram']}',
                            style: TextStyle(
                                fontFamily: 'JosefinSans',
                                fontWeight: FontWeight.w500,
                                color: brandGreyColor)),
                        Text('${order['date']}',
                            style: TextStyle(
                                fontFamily: 'JosefinSans',
                                fontWeight: FontWeight.w500,
                                color: brandGreyColor)),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              HorizontalStatusStep(
                label: 'Allocated',
                completed: true,
                isFirst: true,
                isLast: false,
              ),
              HorizontalStatusStep(
                label: 'In Progress',
                completed: true,
                isFirst: false,
                isLast: false,
              ),
              HorizontalStatusStep(
                label: 'Completed',
                completed: false,
                isFirst: false,
                isLast: false,
              ),
              HorizontalStatusStep(
                label: 'Delivered',
                completed: false,
                isFirst: false,
                isLast: true,
              ),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: List.generate(labels.length, (index) {
              return GestureDetector(
                onTap: () {
                  setState(() {
                    selectedIndex = index;
                  });
                },
                child: actionButton(
                  labels[index],
                  borderColors[index],
                  isSelected: selectedIndex == index,
                ),
              );
            }),
          ),
          SizedBox(height: 10),
          Divider(),
        ],
      ),
    );
  }

  Widget actionButton(String label, Color borderColor,
      {required bool isSelected}) {
    return Container(
        margin: const EdgeInsets.only(right: 8),
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
        decoration: BoxDecoration(
          color: isSelected ? borderColor : Colors.white,
          border: Border.all(color: borderColor, width: 1.5),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            Text(
              label,
              style: TextStyle(
                fontFamily: 'JosefinSans',
                fontWeight: FontWeight.w500,
                color: isSelected ? Colors.white : borderColor,
              ),
            ),
          ],
        ));
  }
}

class HorizontalStatusStep extends StatelessWidget {
  final String label;
  final bool completed;
  final bool isFirst;
  final bool isLast;

  const HorizontalStatusStep({
    super.key,
    required this.label,
    required this.completed,
    required this.isFirst,
    required this.isLast,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              if (!isFirst)
                Expanded(
                  child: Container(
                    height: 2,
                    color: brandGoldColor,
                  ),
                ),
              Column(
                children: [
                  Container(
                    padding: const EdgeInsets.all(2),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: brandGoldColor,
                        width: 1,
                      ),
                    ),
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 15,
                      child: completed
                          ? const Icon(Icons.check,
                              color: brandGoldColor, size: 16)
                          : const Icon(Icons.circle,
                              size: 12, color: brandGoldColor),
                    ),
                  ),
                  Text(
                    label,
                    style: const TextStyle(
                      fontFamily: 'JosefinSans',
                      fontWeight: FontWeight.w500,
                      fontSize: 12,
                      color: brandGreyColor,
                    ),
                  ),
                ],
              ),
              if (!isLast)
                Expanded(
                  child: Container(
                    height: 2,
                    color: brandGoldColor,
                  ),
                ),
            ],
          ),
          const SizedBox(height: 4),
        ],
      ),
    );
  }
}
