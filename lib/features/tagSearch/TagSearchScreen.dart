import 'dart:convert';

import 'package:barcode_scan2/barcode_scan2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tn_jewellery_admin/features/tagSearch/controller/tag_controller.dart';
import 'package:tn_jewellery_admin/utils/colors.dart';
import 'package:tn_jewellery_admin/utils/styles.dart';

class TagSearchScreen extends StatefulWidget {
  const TagSearchScreen({super.key});

  @override
  _TagSearchScreenState createState() => _TagSearchScreenState();
}

class _TagSearchScreenState extends State<TagSearchScreen> {
  final TagController controller = Get.find<TagController>();

  @override
  void dispose() {
    clearData();
    super.dispose();
  }

  void clearData() {
    controller.searchTextController.clear();
    controller.tagModel = null;
    controller.images.clear();
    controller.update();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: IconButton(
            icon:
                Icon(Icons.arrow_back_ios_new_sharp, color: brandPrimaryColor),
            onPressed: () {
              Navigator.pop(context); // or Get.back() if using GetX
            },
          ),
          title: Text(
            'Tag Code',
            style: TextStyle(
              fontFamily: 'JosefinSans',
              fontWeight: FontWeight.bold,
              color: brandPrimaryColor,
              fontSize: 18,
            ),
          )),
      body: GetBuilder<TagController>(
        builder: (controller) {
          return SingleChildScrollView(
            padding: EdgeInsets.all(16),
            child: Column(
              children: [
                // 🔍 Search Row
                Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: controller.searchTextController,
                        decoration: InputDecoration(
                          hintText: 'Enter tag code',
                          hintStyle: TextStyle(
                            fontFamily: 'JosefinSans',
                            fontWeight: FontWeight.w500,
                            color: brandGreyColor,
                            fontSize: 15,
                          ),
                          filled: true,
                          fillColor: Colors.white, // White background
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 12, vertical: 14),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                              color: brandGreyColor, // Border color
                              width: 1, // Border width
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                              color:
                                  brandGreyColor, // Border color when focused
                              width: 1,
                            ),
                          ),
                        ),
                      ),
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.search,
                        color: brandGreyColor,
                      ),
                      onPressed: () {
                        controller.getTagSearch(
                          tagCode: controller.searchTextController.text.trim(),
                        );
                      },
                    ),
                    IconButton(
                      icon: Icon(Icons.qr_code_scanner),
                      onPressed: () async {
                        // Add scanner logic
                        var result = await BarcodeScanner.scan();
                        if (result.rawContent.isNotEmpty) {
                          controller.searchTextController.text =
                              result.rawContent;
                          controller.getTagSearch(
                            tagCode:
                                controller.searchTextController.text.trim(),
                          );
                        }
                      },
                    ),
                  ],
                ),
                SizedBox(height: 10),

                if (controller.tagModel?.data != null &&
                    controller.tagModel!.data?.tagCode != null) ...[
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                          'JEWEL DETAILS - ${controller.tagModel?.data?.tagCode ?? ''}',
                          style: TextStyle(
                              color: brandPrimaryColor,
                              fontFamily: 'JosefinSans',
                              fontSize: 16,
                              fontWeight: FontWeight.bold)),
                    ],
                  ),
                  const Divider(),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(controller.tagModel?.data?.productName ?? "",
                          style: TextStyle(
                              color: brandGreyColor,
                              fontSize: 15,
                              fontWeight: FontWeight.bold)),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Gross Weight", style: JosefinSansMedium),
                            Text(controller.tagModel?.data?.tagGwt ?? "",
                                style: JosefinRegular),
                          ]),
                      Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Net Weight", style: JosefinSansMedium),
                            Text(controller.tagModel?.data?.tagNwt ?? "",
                                style: JosefinRegular),
                          ]),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Purity", style: JosefinSansMedium),
                            Text(controller.tagModel?.data?.purityName ?? "",
                                style: JosefinRegular),
                          ]),
                      Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Metal", style: JosefinSansMedium),
                            Text(controller.tagModel?.data?.metalName ?? "",
                                style: JosefinRegular),
                          ]),
                    ],
                  ),
                  const SizedBox(height: 5),

                  // 🪨 Stone Details Table View
                  if (controller.tagModel?.data?.stoneDetails != null &&
                      controller.tagModel!.data!.stoneDetails!.isNotEmpty) ...[
                    Text('Stone Details',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold)),
                    SizedBox(height: 8),
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Column(
                        children: [
                          // Header Row
                          Container(
                            color: Colors.grey[300],
                            padding: EdgeInsets.symmetric(
                                vertical: 8, horizontal: 12),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: const [
                                Expanded(
                                    child: Text('Product',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold))),
                                Expanded(
                                    child: Text('Design',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold))),
                                Expanded(
                                    child: Text('Qty',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold))),
                                Expanded(
                                    child: Text('Amount',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold))),
                              ],
                            ),
                          ),

                          // Data Rows
                          ...controller.tagModel!.data!.stoneDetails!
                              .map((stone) {
                            return Container(
                              padding: EdgeInsets.symmetric(
                                  vertical: 8, horizontal: 12),
                              decoration: BoxDecoration(
                                border: Border(
                                    top: BorderSide(color: Colors.grey[300]!)),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(child: Text(stone.stoneName ?? '-')),
                                  Expanded(child: Text(stone.uomName ?? '-')),
                                  Expanded(
                                      child: Text(
                                          stone.stoneWt?.toString() ?? '-')),
                                  Expanded(
                                      child: Text(
                                          stone.stoneAmount?.toString() ??
                                              '-')),
                                ],
                              ),
                            );
                          }).toList(),
                        ],
                      ),
                    ),
                    SizedBox(height: 16),
                  ],
                ],

                // 🖼️ Image Row
                if (controller.tagModel != null)
                  SizedBox(
                    height: 100,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        ...controller.images.map((img) {
                          return Stack(
                            children: [
                              Container(
                                margin: EdgeInsets.symmetric(horizontal: 4),
                                width: 100,
                                height: 100,
                                child: img['isNew']
                                    ? Image.memory(base64Decode(img['img']),
                                        fit: BoxFit.cover)
                                    : Image.network(img['img'],
                                        fit: BoxFit.cover),
                              ),
                              Positioned(
                                top: 0,
                                right: 0,
                                child: GestureDetector(
                                  onTap: () =>
                                      controller.removeImage(img['id']),
                                  child: Container(
                                    color: Colors.black45,
                                    child:
                                        Icon(Icons.close, color: Colors.white),
                                  ),
                                ),
                              ),
                            ],
                          );
                        }).toList(),
                        // ➕ Add Image Button
                        GestureDetector(
                          onTap: () {
                            Get.bottomSheet(
                              Container(
                                color: Colors.white,
                                child: Wrap(
                                  children: [
                                    ListTile(
                                      leading: Icon(Icons.camera_alt),
                                      title: Text('Camera'),
                                      onTap: () {
                                        Get.back();
                                        controller
                                            .pickImage(ImageSource.camera);
                                      },
                                    ),
                                    ListTile(
                                      leading: Icon(Icons.photo),
                                      title: Text('Gallery'),
                                      onTap: () {
                                        Get.back();
                                        controller
                                            .pickImage(ImageSource.gallery);
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                          child: Container(
                            margin: EdgeInsets.symmetric(horizontal: 8),
                            width: 100,
                            color: Colors.grey[300],
                            child: Icon(Icons.add),
                          ),
                        ),
                      ],
                    ),
                  ),

                SizedBox(height: 20),

                // ✅ Submit Button
                if (controller.images.isNotEmpty)
                  ElevatedButton(
                    onPressed: () => controller.uploadImages(),
                    child: Text("Submit"),
                  ),
              ],
            ),
          );
        },
      ),
    );
  }
}
