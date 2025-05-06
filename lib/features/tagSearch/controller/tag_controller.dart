import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tn_jewellery_admin/features/tagSearch/repository/tag_repo.dart';
import 'package:tn_jewellery_admin/utils/widgets/custom_snackbar.dart';

class TagController extends GetxController implements GetxService {
  final TagRepo tagRepo;
  TagController({required this.tagRepo});

  final TextEditingController searchTextController = TextEditingController();
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  var images = <Map<String, dynamic>>[].obs; // Holds images and metadata
  Map<String, dynamic>? tagDetails = {
    'img': "", // existing base64
    'is_default': false,
    'id': "1",
    'isNew': false,
  };

  final ImagePicker _picker = ImagePicker();

  void clearData() {
    searchTextController.clear();
    tagDetails = null;
    images.clear();
    update();
  }

  /// Search tag
  Future<void> getTagSearch({required String tagCode}) async {
    _isLoading = true;
    update();
    final response = await tagRepo.tagSearch({"tag_code": tagCode});
    if (response != null && response.statusCode == 200) {
      tagDetails = response.body;
      images.clear();

      if (tagDetails?['tag_images'] != null) {
        for (var img in tagDetails!['tag_images']) {
          images.add({
            'img': img['img'], // existing base64
            'is_default': img['is_default'] ?? false,
            'id': "1",
            'isNew': false,
          });
        }
      }

      customSnackBar('Tag Details loaded', isError: false);
    } else {
      print('Invalid Tag Code');
    }
    _isLoading = false;
    update();
  }

  /// Pick image from camera or gallery
  Future<void> pickImage(ImageSource source) async {
    final XFile? picked = await _picker.pickImage(source: source);
    if (picked != null) {
      final bytes = await picked.readAsBytes();
      final base64Image = base64Encode(bytes);

      images.add({
        'img': base64Image,
        'is_default': images.isEmpty, // first added is default
        'id': "1",
        'isNew': true,
      });
      update();
    }
  }

  void removeImage(String id) {
    images.removeWhere((img) => img['id'] == id);
    update();
  }

  /// Upload all images
  Future<void> uploadImages() async {
    if (tagDetails == null || tagDetails!['id'] == null) {
      customSnackBar("Tag ID missing", isError: true);
      return;
    }

    var imagePayload = images
        .map((img) => {
              "img": img['isNew'] ? img['img'] : "", // new ones have base64
              "is_default": img['is_default'],
              "id": img['id'],
            })
        .toList();

    final body = {
      "tag_id": tagDetails!['id'].toString(),
      "tag_images": imagePayload,
    };

    _isLoading = true;
    update();
    final response = await tagRepo.tagImageUpload([body]);

    if (response != null && response.statusCode == 200) {
      customSnackBar('Images uploaded successfully', isError: false);
    } else {
      customSnackBar('Upload failed', isError: true);
    }
    _isLoading = false;
    update();
  }
}
