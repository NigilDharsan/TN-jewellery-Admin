import 'dart:convert';

import 'package:barcode_scan2/barcode_scan2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tn_jewellery_admin/features/tagSearch/controller/tag_controller.dart';
import 'package:tn_jewellery_admin/utils/colors.dart';

class TagSearchScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Tag Code')),
      body: GetBuilder<TagController>(
        builder: (controller) {
          return SingleChildScrollView(
            padding: EdgeInsets.all(16),
            child: Column(
              children: [
                // Search Row
                Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: controller.searchTextController,
                        decoration: InputDecoration(
                          hintText: 'Enter tag code',
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                    IconButton(
                      icon: Icon(Icons.search),
                      onPressed: () {
                        controller.getTagSearch(
                          tagCode: controller.searchTextController.text.trim(),
                        );
                      },
                    ),
                    IconButton(
                      icon: Icon(Icons.qr_code_scanner),
                      onPressed: () async {
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
                SizedBox(height: 16),

                // Tag Info
                if (controller.tagDetails != null) ...[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                          "Product: ${controller.tagDetails!['product_name']}"),
                      Text("Design: ${controller.tagDetails!['design']}"),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Qty: ${controller.tagDetails!['qty']}"),
                      Text("PML: ${controller.tagDetails!['pml']}"),
                    ],
                  ),
                  SizedBox(height: 16),
                ],

                // Image Row
                if (controller.tagDetails != null)
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
                        // Add Image Button
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

                // Submit Button
                if (controller.images.isNotEmpty)
                  GestureDetector(
                    onTap: () {
                      controller.uploadImages();
                    },
                    child: Container(
                      height: 40,
                      width: 150,
                      decoration: BoxDecoration(
                        color: brandGoldDarkColor,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 10),
                          child: Text(
                            "SUBMIT",
                            style: const TextStyle(
                              fontFamily: 'JosefinSans',
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  )
              ],
            ),
          );
        },
      ),
    );
  }
}
