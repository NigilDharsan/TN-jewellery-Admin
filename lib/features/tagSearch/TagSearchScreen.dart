import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tn_jewellery_admin/features/tagSearch/controller/tag_controller.dart';

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
                // 🔍 Search Row
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
                      onPressed: () {
                        // Add scanner logic
                      },
                    ),
                  ],
                ),
                SizedBox(height: 16),

                // 🪨 Stone Details Table View
                if (controller.tagModel?.data?.stoneDetails != null &&
                    controller.tagModel!.data!.stoneDetails!.isNotEmpty) ...[
                  Text('Stone Details',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
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
                          padding:
                              EdgeInsets.symmetric(vertical: 8, horizontal: 12),
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
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(child: Text(stone.stoneName ?? '-')),
                                Expanded(child: Text(stone.uomName ?? '-')),
                                Expanded(
                                    child:
                                        Text(stone.stoneWt?.toString() ?? '-')),
                                Expanded(
                                    child: Text(
                                        stone.stoneAmount?.toString() ?? '-')),
                              ],
                            ),
                          );
                        }).toList(),
                      ],
                    ),
                  ),
                  SizedBox(height: 16),
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
