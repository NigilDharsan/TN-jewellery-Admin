import 'dart:io';

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:tn_jewellery_admin/features/dashboard/controller/dashboard_controller.dart';
import 'package:tn_jewellery_admin/features/my_order/controller/order_controller.dart';
import 'package:tn_jewellery_admin/features/my_order/model/InProgressOrderListModel.dart';
import 'package:tn_jewellery_admin/features/my_order/widgets/Orders_Drop_Down.dart';
import 'package:tn_jewellery_admin/features/my_order/model/openOrderListModel.dart';
import 'package:tn_jewellery_admin/features/my_order/widgets/StepIndicator.dart';
import 'package:tn_jewellery_admin/utils/colors.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:tn_jewellery_admin/utils/core/helper/route_helper.dart';

class OrderStatusPage extends StatefulWidget {
  const OrderStatusPage({super.key});

  @override
  State<OrderStatusPage> createState() => _OrderStatusPageState();
}

class _OrderStatusPageState extends State<OrderStatusPage> {
  int selectedIndex = 0; // Default selected button

  List<String> labels = ['CANCEL ORDER', 'COMPLETE STATUS'];
  List<Color> borderColors = [brandGoldColor, brandGoldColor];

  final List<String> workStatusList = [
    'Approved List',
    'CAD Issue',
    'CAD Receipt',
    'CAM Issue',
    'CAM Receipt',
    'Production Issue',
    'Production Receipt',
    'Delivery Ready',
    'Over Due Orders'
  ];

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OrderController>(builder: (controller) {
      return buildOrderDetails(controller);
    });
  }

  Widget buildOrderDetails(OrderController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(right: 5, bottom: 1),
                child: customDropdown(
                    label: 'Work Status',
                    labelStyle: const TextStyle(
                      fontFamily: 'JosefinSans',
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: brandGreyColor,
                    ),
                    selectedValue: controller.selectedWorkStatus,
                    items: workStatusList,
                    onChanged: (value) {
                      controller.selectedWorkStatus = value ?? "";
                      controller.update();
                      controller.filterBody = {
                        "id_supplier": "",
                        "id_customer": "",
                        "date": "",
                      };
                      controller.selectedVendor = null;
                      controller.selectedDate = null;
                      if (controller.selectedWorkStatus == "Approved List") {
                        controller.selectedWorkStatusID = "1";
                        controller.currentStep = 1;
                        controller.getCurrentOrderList({"filter_type":"1"});
                      } else if (controller.selectedWorkStatus == "CAD Issue") {
                        controller.selectedWorkStatusID = "2";
                        controller.currentStep = 2;
                        controller.getCurrentOrderList({"filter_type":"2"});
                      } else if (controller.selectedWorkStatus == "CAD Receipt") {
                        controller.selectedWorkStatusID = "3";
                        controller.currentStep = 2;
                        controller.getCurrentOrderList({"filter_type":"3"});
                      }else if (controller.selectedWorkStatus == "CAM Issue") {
                        controller.selectedWorkStatusID = "4";
                        controller.currentStep = 3;
                        controller.getCurrentOrderList({"filter_type":"4"});
                      }else if (controller.selectedWorkStatus == "CAM Receipt") {
                        controller.selectedWorkStatusID = "5";
                        controller.currentStep = 3;
                        controller.getCurrentOrderList({"filter_type":"5"});
                      }else if (controller.selectedWorkStatus == "Production Issue") {
                        controller.selectedWorkStatusID = "6";
                        controller.currentStep = 4;
                        controller.getCurrentOrderList({"filter_type":"6"});
                      }else if (controller.selectedWorkStatus == "Production Receipt") {
                        controller.selectedWorkStatusID = "7";
                        controller.currentStep = 4;
                        controller.getCurrentOrderList({"filter_type":"7"});
                      }else if (controller.selectedWorkStatus == "Delivery Ready") {
                        controller.selectedWorkStatusID = "8";
                        controller.currentStep = 7;
                        controller.getCurrentOrderList({"filter_type":"7"});
                      }else if (controller.selectedWorkStatus == "Over Due Orders") {
                        controller.selectedWorkStatusID = "9";
                        controller.currentStep = 3;
                        controller.getCurrentOrderList({"filter_type":"8"});
                      }else{
                        controller.selectedWorkStatusID = "1";
                        controller.currentStep = 2;
                        controller.getCurrentOrderList({"filter_type":"0"});
                      }
                    }),
              ),
            ),
            /* Expanded(
              child: Padding(
                padding: const EdgeInsets.only(right: 5),
                child:
                    // controller.selectedWorkStatus == "In Progress"
                    //     ? customDropdown(
                    //         label: 'Vendor Wise',
                    //         labelStyle: const TextStyle(
                    //           fontFamily: 'JosefinSans',
                    //           fontSize: 12,
                    //           fontWeight: FontWeight.w500,
                    //           color: brandGreyColor,
                    //         ),
                    //         selectedValue: controller.selectedVendor,
                    //         items: controller.supplierListModel!.data!
                    //             .map((e) => e.supplierName ?? '')
                    //             .toList(),
                    //         onChanged: (value) {
                    //           controller.selectedVendor = value;
                    //           var supplierID = controller.supplierListModel!.data!
                    //               .firstWhere((e) => e.supplierName == value)
                    //               .idSupplier;
                    //           controller.filterBody = {
                    //             "id_supplier": supplierID,
                    //             "id_customer": "",
                    //             "date": controller.formatDateToYMD(),
                    //           };
                    //           controller.getOrderStatusList(
                    //               controller.selectedWorkStatusID,
                    //               controller.filterBody);
                    //         })
                    //     :
                    customDropdownDetails(
                  label: controller.selectedVendor != null
                      ? controller.selectedVendor ?? ""
                      : controller.selectedWorkStatus == "In Progress"
                          ? 'Vendor Wise'
                          : 'Customer Wise',
                  labelStyle: const TextStyle(
                    fontFamily: 'JosefinSans',
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: brandGreyColor,
                  ),
                  onPressed: () {
                    // Navigate to dropdown page or open a bottom sheet
                    Get.to(() => OrdersDropDown())?.then((onValue) {
                      if (onValue != null) {
                        if (controller.selectedWorkStatus == "In Progress") {
                          controller.selectedVendor = onValue;
                          var supplierID = controller.supplierListModel!.data!
                              .firstWhere((e) => e.supplierName == onValue)
                              .idSupplier;
                          controller.filterBody = {
                            "id_supplier": supplierID,
                            "id_customer": "",
                            "date": controller.formatDateToYMD(),
                          };
                          controller.getOrderStatusList(
                              controller.selectedWorkStatusID,
                              controller.filterBody);
                        } else {
                          controller.selectedVendor = onValue;
                          var customerID = Get.find<DashboardController>()
                              .customerModel!
                              .data!
                              .firstWhere((e) => e.name == onValue)
                              .idCustomer;
                          controller.filterBody = {
                            "id_supplier": "",
                            "id_customer": customerID,
                            "date": controller.formatDateToYMD(),
                          };
                          controller.getOrderStatusList(
                              controller.selectedWorkStatusID,
                              controller.filterBody);
                        }
                      }
                    });
                  },
                ),

                // customDropdown(
                //     label: 'Customer Wise',
                //     labelStyle: const TextStyle(
                //       fontFamily: 'JosefinSans',
                //       fontSize: 12,
                //       fontWeight: FontWeight.w500,
                //       color: brandGreyColor,
                //     ),
                //     selectedValue: controller.selectedVendor,
                //     items: Get.find<DashboardController>()
                //         .customerModel!
                //         .data!
                //         .map((e) => e.name ?? '')
                //         .toList(),
                //     onChanged: (value) {
                //       controller.selectedVendor = value;
                //       var customerID = Get.find<DashboardController>()
                //           .customerModel!
                //           .data!
                //           .firstWhere((e) => e.name == value)
                //           .idCustomer;
                //       controller.filterBody = {
                //         "id_supplier": "",
                //         "id_customer": customerID,
                //         "date": controller.formatDateToYMD(),
                //       };
                //       controller.getOrderStatusList(
                //           controller.selectedWorkStatusID,
                //           controller.filterBody);
                //     },
                //   ),
              ),
            ),
             */Container(
              height: 50,
              padding: const EdgeInsets.symmetric(horizontal: 12),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(15),
              ),
              alignment: Alignment.center,
              child: GestureDetector(
                onTap: () {
                  controller.pickDate(controller);
                },
                child: Text(
                  controller.selectedDate == null
                      ? "Delivery Date"
                      : controller.formatDateToYMD(),
                  style: const TextStyle(
                    fontFamily: 'JosefinSans',
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    color: brandGreyColor,
                  ),
                ),
              ),
            ),
          ],
        ),
        Expanded(
          child: ListView.separated(
            itemCount: controller.inProgressOrderListModel?.data?.length ?? 0,
            separatorBuilder: (c, _) => const SizedBox(height: 12),
            itemBuilder: (context, index) {
              var orderListData =
              controller.openOrderListModel?.data?[index];
              return orderDetailsStatus(controller,
                  controller.inProgressOrderListModel?.data![index], orderListData);
            },
          ),
        )
      ],
    );
  }

  Widget orderDetailsStatus(
      OrderController controller, InProgressOrderData? inProgressOrderData, OpenOrderData? orderListData) {
    return Padding(
      padding: const EdgeInsets.only(top: 12, bottom: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              GestureDetector(
                onTap: () {
                  // Your action here
                  controller.selectNewOrderListData = orderListData;
                  controller.update();
                  Get.toNamed(RouteHelper.orderdetailScreen)?.then((value) {

                  });
                },
                child: Container(
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
              ),

              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text("${inProgressOrderData?.customerName ?? ''} - ",
                            style: const TextStyle(
                                fontFamily: 'JosefinSans',
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: textColor)),
                        const SizedBox(width: 5),
                        GestureDetector(
                          onTap: () {
                            final phone =
                                inProgressOrderData?.customerMobile ?? '';
                            if (phone.isNotEmpty) {
                              launchUrl(Uri.parse("tel:$phone"));
                            }
                          },
                          child: Text(
                            inProgressOrderData?.customerMobile ?? '',
                            style: const TextStyle(
                              fontFamily: 'JosefinSans',
                              fontSize: 14,
                              color: Colors.blue,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          inProgressOrderData?.productName ?? '',
                          style: TextStyle(
                              fontFamily: 'JosefinSans',
                              fontWeight: FontWeight.w500,
                              color: brandGreyColor),
                        ),
                        Text(
                            "${inProgressOrderData?.grossWt.toString()}" + ' g',
                            style: TextStyle(
                                fontFamily: 'JosefinSans',
                                fontWeight: FontWeight.w500,
                                color: brandGreyColor)),
                        Text(inProgressOrderData?.customerDueDate ?? '',
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
          Padding(
            padding: const EdgeInsets.all(6.0),
            child: StepIndicator(currentStep: controller.currentStep),
          ),
          const SizedBox(height: 10),
          if(Get.find<OrderController>().selectedWorkStatusID != "8")
            getActionButton(inProgressOrderData),

          SizedBox(height: 10),
          Divider(thickness: 1, color: Colors.grey[300]),
        ],
      ),
    );
  }


  Widget getActionButton(dynamic inProgressOrderData) {

    final controller = Get.find<OrderController>();
    final statusID = controller.selectedWorkStatusID;

    String buttonText = "";
    String remarks = "";
    int processType = 0;

    switch (statusID) {
      case "1":
        buttonText = "CAD Issue";
        remarks = "Item issued to CAD process";
        processType = 2;
        break;
      case "2":
        buttonText = "CAD Done";
        remarks = "CAD process completed";
        processType = 3;
        break;
      case "3":
        buttonText = "CAM Issue";
        remarks = "Item issued to CAM process";
        processType = 4;
        break;
      case "4":
        buttonText = "CAM Done";
        remarks = "CAM process completed";
        processType = 5;
        break;
      case "5":
        buttonText = "Production Issue";
        remarks = "Item issued to Production";
        processType = 6;
        break;
      case "6":
        buttonText = "Production Done";
        remarks = "Production process completed";
        processType = 7;
        break;
      case "7":
        buttonText = "Delivered";
        remarks = "Order Delivered";
        processType = 8;
        break;
      case "8":
        buttonText = "Deliver Now";
        remarks = "Item Delivered";
        processType = 5; // or whatever is correct for delivery
        break;
      default:
        return const SizedBox.shrink();
    }

    return Center(
      child: InkWell(
        onTap: () async {
          await controller.OrderUpdateStatus(body: {
            "process_type": processType,
            "added_through": 2,
            "order_detail_ids": [
              {
                "detail_id": "${inProgressOrderData?.detailId ?? 0}",
                "remarks": remarks
              }
            ]
          });

          await controller.getCurrentOrderList({
            "filter_type": controller.selectedWorkStatusID,
          });
        },
        child: Container(
          width: 130,
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
          decoration: BoxDecoration(
            color: brandGoldColor,
            border: Border.all(color: brandGoldColor, width: 1.5),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Center(
            child: Text(
              buttonText,
              style: const TextStyle(
                fontFamily: 'JosefinSans',
                fontWeight: FontWeight.w500,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }


  Widget actionButton(String label, Color borderColor,
      {required bool isSelected}) {
    return Container(
        margin: const EdgeInsets.only(right: 1),
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

Widget customDropdown({
  required String label,
  required TextStyle labelStyle,
  required String? selectedValue,
  required List<String> items,
  required Function(String?) onChanged,
}) {
  return Container(
    height: 50,
    decoration: BoxDecoration(
      border: Border.all(color: Colors.grey),
      borderRadius: BorderRadius.circular(15),
    ),
    child: DropdownButtonHideUnderline(
      child: DropdownButton2<String>(
        isExpanded: true,
        value: selectedValue,
        hint: Expanded(
          child: Text(
            label,
            style: labelStyle,
          ),
        ),
        items: items.map((value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                value,
                style: labelStyle,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          );
        }).toList(),
        onChanged: onChanged,
        iconStyleData: const IconStyleData(
          icon: Icon(Icons.arrow_drop_down, color: Colors.grey),
        ),
        dropdownStyleData: DropdownStyleData(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.white,
          ),
        ),
        menuItemStyleData: const MenuItemStyleData(
          padding: EdgeInsets.symmetric(horizontal: 6, vertical: 1),
        ),
      ),
    ),
  );
}

Widget customDropdownDetails({
  required String label,
  required TextStyle labelStyle,
  required VoidCallback onPressed,
}) {
  return InkWell(
    onTap: onPressed,
    child: Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Text(
              label,
              style: labelStyle,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          const Icon(Icons.arrow_drop_down, color: Colors.black),
        ],
      ),
    ),
  );
}

Future<void> shareProductMedia() async {
  final controller = Get.find<OrderController>();
  final String productName =
      controller.selectNewOrderListData?.productName ?? "";
  final String weight = controller.selectNewOrderListData?.grossWt ?? "";
  final String design = controller.selectNewOrderListData?.designName ?? "";
  final String order = controller.selectNewOrderListData?.orderNo ?? "";
  final String description = controller.selectNewOrderListData?.remarks ?? "";

  final List<String> imageUrls =
  (controller.selectNewOrderListData?.previewImages ?? [])
      .map<String>((e) => e.image ?? "")
      .where((url) => url.isNotEmpty)
      .toList();

  final List<String> videoUrls =
  (controller.selectNewOrderListData?.previewVideos ?? [])
      .map<String>((e) => e.video ?? "")
      .where((url) => url.isNotEmpty)
      .toList();

  final List<String> audioUrls =
  (controller.selectNewOrderListData?.previewVoices ?? [])
      .map<String>((e) => e.audio ?? "")
      .where((url) => url.isNotEmpty)
      .toList();

  final List<String> allUrls = [...imageUrls, ...videoUrls, ...audioUrls];
  final List<XFile> filesToShare = [];

  final String message = '''
Check out this product:
Order No: $order
Product Name: $productName
Design: $design
Gross Weight: $weight
Description: $description
''';

  final tempDir = await getTemporaryDirectory();
  Get.dialog(
    Center(child: CircularProgressIndicator()),
    barrierDismissible: true,
  );
  for (final url in allUrls) {
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final fileName = basename(Uri.parse(url).path);
        final filePath = '${tempDir.path}/$fileName';
        final file = File(filePath);
        await file.writeAsBytes(response.bodyBytes);

        // Detect MIME type
        final ext = fileName.split('.').last.toLowerCase();
        String mimeType = 'application/octet-stream';
        if (['jpg', 'jpeg'].contains(ext))
          mimeType = 'image/jpeg';
        else if (ext == 'png')
          mimeType = 'image/png';
        else if (ext == 'mp4')
          mimeType = 'video/mp4';
        else if (['mp3', 'aac', 'wav'].contains(ext)) mimeType = 'audio/mpeg';

        filesToShare.add(XFile(filePath, mimeType: mimeType, name: fileName));
      }
    } catch (e) {
      print('Download failed for $url: $e');
    }
  }
  if (Get.isDialogOpen ?? false) {
    Get.back();
  }
  if (filesToShare.isNotEmpty) {
    // await Share.shareXFiles(filesToShare, text: message);
    await Share.shareXFiles([filesToShare.first], text: message);
  } else {
    await Share.share(message);
  }
}
