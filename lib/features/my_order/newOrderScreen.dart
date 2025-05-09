import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:tn_jewellery_admin/features/my_order/controller/order_controller.dart';
import 'package:tn_jewellery_admin/features/my_order/model/SupplierListModel.dart'
    show SupplierListData, SupplierListModel;
import 'package:tn_jewellery_admin/utils/colors.dart';
import 'package:tn_jewellery_admin/utils/widgets/custom_text_field.dart'
    show TextFieldDatePicker;

class newOrderScreen extends StatefulWidget {
  const newOrderScreen({super.key});

  @override
  State<newOrderScreen> createState() => _newOrderScreenState();
}

class _newOrderScreenState extends State<newOrderScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: GetBuilder<OrderController>(
            autoRemove: false,
            builder: (controller) {
              return controller.isLoading
                  ? Container()
                  : buildOrderDetail(controller);
            }));
  }

  Widget buildOrderDetail(OrderController controller) {
    return SingleChildScrollView(child: Padding(
      padding: const EdgeInsets.all(15),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 100),
          Container(
            height: 500,
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.grey[400],
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 20),
                Text("Select Karikar",
                    style: TextStyle(
                        fontFamily: 'JosefinSans',
                        color: Colors.black,
                        fontSize: 15,
                        fontWeight: FontWeight.bold)),
                SizedBox(height: 10),
                Expanded(
                  child: Container(
                    width: MediaQuery.sizeOf(context).width,
                    decoration: BoxDecoration(
                      color: secondaryColor,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<int>(
                          hint: const Text("Select Supplier",style: TextStyle(color: brandGreyColor,fontSize: 14),),
                          padding: const EdgeInsets.only(
                              top: 8.0, bottom: 8.0, left: 8, right: 2.0),
                          value: controller.SupplierId, // Now comparing by id
                          icon: const Icon(
                            Icons.keyboard_arrow_down,
                            color: Colors.black,
                            size: 30,
                          ),
                          dropdownColor: secondaryColor,
                          style: const TextStyle(
                            fontFamily: 'JosefinSans',
                            color: brandGoldColor,
                            fontWeight: FontWeight.w700,
                            fontSize: 18,
                          ),
                          items: controller.supplierListModel?.data
                              ?.map((SupplierListData supplier) {
                            return DropdownMenuItem<int>(
                              value: supplier.idSupplier,
                              child: Text(

                                  supplier.supplierName ?? "Select Supplier"),
                            );
                          }).toList(),
                          onChanged: (int? newId) {
                            setState(() {
                              controller.SupplierId = newId;
                              controller.selectedSupplier = controller
                                  .supplierListModel?.data
                                  ?.firstWhere((s) => s.idSupplier == newId);
                            });
                          },
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 30),
                Text("Required Delivery Date",
                    style: TextStyle(
                        fontFamily: 'JosefinSans',
                        color: Colors.black,
                        fontSize: 15,
                        fontWeight: FontWeight.bold)),
                SizedBox(height: 10),
                TextFieldDatePicker(
                  Controller: controller.selectDeliveryDate,
                  onChanged: null,
                  hintText: 'dd/MM/yyyy',
                  onTap: () async {
                    FocusScope.of(context).unfocus();
                    DateTime? pickedDate = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime.now(),
                      lastDate: DateTime(2050),
                    );
                    if (pickedDate != null) {
                      String formattedDate =
                          DateFormat("yyyy-MM-dd").format(pickedDate);
                      if (mounted) {
                        setState(() {
                          controller.selectDeliveryDate.text = formattedDate;
                        });
                      }
                    }
                  },
                  validating: (value) {
                    if (value!.isEmpty) {
                      return 'Please select Date of Birth';
                    }
                  },
                  isDownArrow: true,
                ),
                SizedBox(height: 30),
                Text("Your comments",
                    style: TextStyle(
                        fontFamily: 'JosefinSans',
                        color: Colors.black,
                        fontSize: 15,
                        fontWeight: FontWeight.bold)),
                SizedBox(height: 20),
                Container(
                  height: 100,
                  decoration: BoxDecoration(
                    color: secondaryColor,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      maxLines: 5,
                      controller: controller.comment,
                      decoration: InputDecoration(
                        hintText:
                            "Some Text describing the changes the cusopmer looking for the retailer",
                        hintStyle: TextStyle(
                            fontFamily: 'JosefinSans',
                            color: brandGreyColor,
                            fontSize: 14,
                            fontWeight: FontWeight.w500),
                        border: InputBorder.none,
                        contentPadding:
                            const EdgeInsets.symmetric(horizontal: 10),
                      ),
                      style: const TextStyle(color: Colors.black),
                    ),
                  ),
                ),
                SizedBox(height: 40),
                GestureDetector(
                  onTap: () async {
                    Map<String, dynamic> body = {
                      "assigned_to": 1, //constant
                      "employee": null, //constant
                      "added_through": 2, //constant
                      "supplier": controller.SupplierId,
                      "order_detail_ids": [
                        {
                          "detail_id":
                              controller.selectNewOrderListData?.detailId ?? 0,
                          "karigar_due_date":
                              controller.selectDeliveryDate.text,
                          "remarks": controller.comment.text
                        }
                      ]
                    };
                    var status = await controller.orderAssign(body);
                    if (status) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text("Order successfully assigned"),
                          backgroundColor: Colors.green,
                          duration: Duration(seconds: 2),
                        ),
                      );
                      await Future.delayed(Duration(seconds: 1));
                      Navigator.pop(context);
                      Navigator.pop(context, true);
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text("Failed to assign order"),
                          backgroundColor: Colors.red,
                          duration: Duration(seconds: 2),
                        ),
                      );
                    }
                  },
                  child: Container(
                    height: 50,
                    decoration: BoxDecoration(
                      color: brandGoldColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: Text(
                        "ASSIGN TO KARIKAR",
                        style: const TextStyle(
                          fontFamily: 'JosefinSans',
                          color: secondaryColor,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ),);
  }
}
