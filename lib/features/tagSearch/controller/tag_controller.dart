import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tn_jewellery_admin/features/tagSearch/model/TagModel.dart';
import 'package:tn_jewellery_admin/features/tagSearch/repository/tag_repo.dart';
import 'package:tn_jewellery_admin/utils/widgets/custom_snackbar.dart';

class TagController extends GetxController implements GetxService {
  final TagRepo tagRepo;
  TagController({required this.tagRepo});

  final TextEditingController searchTextController = TextEditingController();

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  TagModel? tagModel; // Now holds full tag model including stone details

  var images = <Map<String, dynamic>>[].obs; // Holds images and metadata

  final ImagePicker _picker = ImagePicker();

  void clearData() {
    searchTextController.clear();
    tagModel = null;
    images.clear();
    update();
  }

  /// 🔍 Search by tag code
  Future<void> getTagSearch({required String tagCode}) async {
    _isLoading = true;
    update();

    final response = await tagRepo.tagSearch({"tag_code": tagCode});

    if (response != null && response.statusCode == 200) {
      tagModel = TagModel.fromJson(response.body); // parse to TagModel
      images.clear();

      // Load tag images from model if available
      if (tagModel?.data?.tagImages != null) {
        for (var img in tagModel!.data!.tagImages!) {
          images.add({
            'img': img.tagImage ?? '',
            'is_default': img.isDefault ?? false,
            'id': img.id?.toString() ?? "0",
            'isNew': false,
          });
        }
      }

      customSnackBar('Tag Details loaded', isError: false);
    } else {
      customSnackBar('Invalid Tag Code', isError: true);
    }

    _isLoading = false;
    update();
  }

  /// 📷 Pick image from gallery/camera
  Future<void> pickImage(ImageSource source) async {
    final XFile? picked = await _picker.pickImage(source: source);
    if (picked != null) {
      final bytes = await picked.readAsBytes();
      final base64Image = base64Encode(bytes);

      images.add({
        'img': base64Image,
        'is_default': images.isEmpty, // First image is default
        'id': DateTime.now().millisecondsSinceEpoch.toString(), // unique id
        'isNew': true,
      });

      update();
    }
  }

  /// 🗑️ Remove image by ID
  void removeImage(String id) {
    images.removeWhere((img) => img['id'] == id);
    update();
  }

  /// ⬆️ Upload images to server
  Future<void> uploadImages() async {
    final tagId = tagModel?.data?.tagId;
    if (tagId == null) {
      customSnackBar("Tag ID missing", isError: true);
      return;
    }

    final imagePayload = images
        .where((img) =>
            img['isNew'] == true) // Only keep images where 'isNew' is true
        .map((img) => {
              "img": img['img'], // Send the actual image only for new images
              "default": true,
              "id": img['id'],
            })
        .toList();

    // If there are no new images to upload, show a warning
    if (imagePayload.isEmpty) {
      customSnackBar("No new images to upload", isError: true);
      return;
    }

    final body = {
      "tag_id": tagId.toString(),
      "tag_images": imagePayload,
    };

    _isLoading = true;
    update();

    final response = await tagRepo.tagImageUpload(body);

    if (response != null && response.statusCode == 200) {
      customSnackBar('Images uploaded successfully', isError: false);
    } else {
      customSnackBar('Upload failed', isError: true);
    }

    _isLoading = false;
    update();
  }
}
