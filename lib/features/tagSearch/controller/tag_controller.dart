import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tn_jewellery_admin/features/tagSearch/model/TagModel.dart';
import 'package:tn_jewellery_admin/features/tagSearch/model/TagWithoutImageListModel.dart';
import 'package:tn_jewellery_admin/features/tagSearch/repository/tag_repo.dart';
import 'package:tn_jewellery_admin/utils/Loader/loader_utils.dart';
import 'package:tn_jewellery_admin/utils/widgets/custom_snackbar.dart';

class AddTagModel {
  final int id;
  final String name;

  AddTagModel({
    required this.id,
    required this.name,
  });
}

class TagController extends GetxController implements GetxService {
  final TagRepo tagRepo;
  TagController({required this.tagRepo});

  final TextEditingController searchTextController = TextEditingController();
  final TextEditingController stringTagController = TextEditingController();

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  String? selectedTag;
  TagModel? tagModel; // Now holds full tag model including stone details
  TagModel? setItemTagModel; // Now holds full tag model including stone details

  TagWithoutImageListModel?
      tagListModel; // Now holds full tag model including stone details

  var images = <Map<String, dynamic>>[].obs; // Holds images and metadata

  final ImagePicker _picker = ImagePicker();

  List<AddTagModel> addedTags = [];

  // void addTag(String tag) {
  //   if (tag.isNotEmpty && !addedTags.contains(tag)) {
  //     addedTags.add(tag);
  //     stringTagController.clear();

  //     update();
  //   }
  // }

  Future<void> removeTag(int tagID) async {
    loaderController.showLoaderAfterBuild(true);

    final response = await tagRepo.tagRemove(tagID);

    if (response != null && response.statusCode == 200) {
      customSnackBar('Tag Removed', isError: false);
    } else {
      customSnackBar('Tag Not Removed', isError: true);
    }

    addedTags.remove(tagID);
    addedTags.removeWhere((item) => item.id == tagID);
    loaderController.showLoaderAfterBuild(false);

    update();
  }

  void clearData() {
    stringTagController.clear();
    tagModel = null;
    images.clear();
    addedTags.clear();
    update();
  }

  Future<void> getTagSearch({required String tagCode}) async {
    _isLoading = true;
    loaderController.showLoaderAfterBuild(_isLoading);

    final response = await tagRepo.tagSearch({"tag_code": tagCode});

    if (response != null && response.statusCode == 200) {
      tagModel = TagModel.fromJson(response.body); // parse to TagModel
      images.clear();
      addedTags.clear();

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

      if (tagModel?.data?.relatedItems != null) {
        for (var item in tagModel!.data!.relatedItems!) {
          if (item.tagCode != null && item.tagCode!.isNotEmpty) {
            addedTags.add(AddTagModel(id: item.tagId!, name: item.oldTagCode!));
          }
        }
      }

      customSnackBar('Tag Details loaded', isError: false);
    } else {
      clearData();
      customSnackBar('Invalid Tag Code', isError: true);
    }

    _isLoading = false;
    loaderController.showLoaderAfterBuild(_isLoading);

    update();
  }

  Future<void> getSetItemTagSearch({required String tagCode}) async {
    _isLoading = true;
    loaderController.showLoaderAfterBuild(_isLoading);

    final response = await tagRepo.tagSearch({"tag_code": tagCode});

    if (response != null && response.statusCode == 200) {
      setItemTagModel = TagModel.fromJson(response.body); // parse to TagModel

      customSnackBar('Tag Details loaded', isError: false);
    } else {
      clearData();
      customSnackBar('Invalid Tag Code', isError: true);
    }

    _isLoading = false;
    loaderController.showLoaderAfterBuild(_isLoading);

    update();
  }

  Future<void> getTagWithoutImageList() async {
    _isLoading = true;
    update();
    loaderController.showLoaderAfterBuild(_isLoading);

    final response = await tagRepo.tagWithOutImage();

    if (response != null && response.statusCode == 200) {
      tagListModel =
          TagWithoutImageListModel.fromJson(response.body); // parse to TagModel

      customSnackBar('Tag Details loaded', isError: false);
    } else {
      clearData();
      customSnackBar('Invalid Tag Code', isError: true);
    }

    _isLoading = false;
    loaderController.showLoaderAfterBuild(_isLoading);

    update();
  }

  Future<void> addSetItemTag({required String tagCode}) async {
    final tagId = tagModel?.data?.tagId;

    final body = {
      "tag_id": tagId.toString(),
      "set_items": [
        {"tag_code": tagCode},
      ]
    };

    _isLoading = true;
    loaderController.showLoaderAfterBuild(_isLoading);

    update();

    final response = await tagRepo.tagAdded(body);

    if (response != null && response.statusCode == 201) {
      if (tagCode.isNotEmpty && !addedTags.contains(tagCode)) {
        addedTags.add(AddTagModel(id: tagId!, name: tagCode));
        stringTagController.clear();

        update();
      }
    } else {}

    _isLoading = false;
    loaderController.showLoaderAfterBuild(_isLoading);

    update();
  }

  Future<Uint8List?> compressImageBelow1MB(File file) async {
    int quality = 90;
    Uint8List? compressed;

    // Loop to reduce quality until size is below 1MB
    while (quality > 10) {
      final result = await FlutterImageCompress.compressWithFile(
        file.path,
        quality: quality,
      );

      if (result == null) break;

      final sizeInKB = result.lengthInBytes / 1024;

      if (sizeInKB <= 1024) {
        compressed = result;
        break;
      }

      quality -= 10; // reduce quality and try again
    }

    return compressed;
  }

  /// 📷 Pick image from gallery/camera
  Future<void> pickImage(ImageSource source) async {
    final XFile? picked = await _picker.pickImage(source: source);

    if (picked != null) {
      final File file = File(picked.path);

      final Uint8List? compressedBytes = await compressImageBelow1MB(file);

      if (compressedBytes != null) {
        final base64Image = base64Encode(compressedBytes);

        images.add({
          'img': base64Image,
          'is_default': images.isEmpty,
          'id': DateTime.now().millisecondsSinceEpoch.toString(),
          'isNew': true,
        });

        update();
      } else {
        print("⚠️ Compression failed or image too large");
      }
    }
  }

  /// 🗑️ Remove image by ID
  void removeImage(String id) {
    images.removeWhere((img) => img['id'] == id);
    update();
  }

  /// ⬆️ Upload images to server
  Future<void> uploadImages() async {
    loaderController.showLoaderAfterBuild(true);

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

    if (response != null && response.statusCode == 202) {
      clearData();
      customSnackBar(response.body['message'], isError: false);
    } else {
      customSnackBar(response?.body['message'], isError: true);
    }

    _isLoading = false;
    loaderController.showLoaderAfterBuild(_isLoading);

    update();
  }
}
