import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:tn_jewellery_admin/features/my_order/model/InProgressOrderListModel.dart';
import 'package:tn_jewellery_admin/features/my_order/model/SupplierListModel.dart';
import 'package:tn_jewellery_admin/features/my_order/model/openOrderListModel.dart';
import 'package:tn_jewellery_admin/features/my_order/repository/order_repo.dart';
import 'package:tn_jewellery_admin/utils/Loader/loader_utils.dart';
import 'package:tn_jewellery_admin/utils/widgets/custom_snackbar.dart';

class OrderController extends GetxController implements GetxService {
  final OrderRepo orderRepo;

  bool _isLoading = false;
  bool hasMoreItems = true;
  bool get isLoading => _isLoading;

  var selectedWorkStatus = "In Progress";
  var selectedWorkStatusID = "inprogress";

  var currentStep = 2;

  OpenOrderListModel? openOrderListModel;
  OpenOrderData? selectNewOrderListData;

  InProgressOrderListModel? inProgressOrderListModel;
  SupplierListModel? supplierListModel;
  SupplierListData? selectedSupplier;
  TextEditingController selectDeliveryDate = TextEditingController();
  TextEditingController comment = TextEditingController();
  int? SupplierId;

  bool isNewOrdersSelected = true;

  String? selectedVendor;
  DateTime? selectedDate;
  dynamic filterBody = {
    "id_supplier": "",
    "id_customer": "",
    "date": "",
  };

  OrderController({required this.orderRepo});

  bool isCurrentPlaying = false; // Tracks if audio is currently playing
  String? currentPlayingFile;
  AudioPlayer audioPlayer = AudioPlayer(); // Initialize AudioPlayer

  Future<void> playSegment(String filePath) async {
    if (currentPlayingFile != filePath) {
      if (isCurrentPlaying) {
        await audioPlayer.stop();
      }
      await audioPlayer
          .play(DeviceFileSource(filePath)); // Play the selected audio file
      isCurrentPlaying = true;
      currentPlayingFile = filePath; // Update current playing file
      update();
    }
  }

  Future<void> stopPlayback() async {
    await audioPlayer.stop();
    isCurrentPlaying = false;
    currentPlayingFile = null; // Clear current playing file
    update();
  }

  Future<void> pickDate(OrderController controller) async {
    final DateTime? picked = await showDatePicker(
      context: Get.context!,
      initialDate: controller.selectedDate ?? DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2100),
    );
    if (picked != null && picked != controller.selectedDate) {
      controller.selectedDate = picked;
      controller.update();
    }
  }

  // Date Convert
  String formatDateToYMD() {
    if (selectedDate == null) {
      return '';
    }
    return DateFormat('yyyy-MM-dd').format(selectedDate!);
  }

  Future<void> downloadFile(BuildContext context, String filePath) async {
    var status =
        await Permission.storage.request(); // Request storage permissions
  }

  Future<void> getNewOrderList() async {
    _isLoading = true;
    loaderController.showLoaderAfterBuild(_isLoading);

    update();
    Response? response = await orderRepo.orderList();
    if (response != null && response.statusCode == 200) {
      openOrderListModel = OpenOrderListModel.fromJson(response.body);
    } else {
      print('Invalid User');
    }

    _isLoading = false;
    loaderController.showLoaderAfterBuild(_isLoading);

    update();
  }

  Future<void> getSupplierList() async {
    _isLoading = true;
    loaderController.showLoaderAfterBuild(_isLoading);

    Response? response = await orderRepo.getSupplierRepo();
    if (response != null && response.statusCode == 200) {
      supplierListModel = SupplierListModel.fromJson(response.body);
    } else {
      print('Invalid User');
    }

    _isLoading = false;
    loaderController.showLoaderAfterBuild(_isLoading);

    update();
  }

  Future<void> getOrderStatusList(String orderStatus, dynamic body) async {
    _isLoading = true;
    loaderController.showLoaderAfterBuild(_isLoading);

    update();
    Response? response = await orderRepo.orderStatusList(orderStatus, body);
    if (response != null && response.statusCode == 200) {
      inProgressOrderListModel =
          InProgressOrderListModel.fromJson(response.body);
    } else {
      print('Invalid User');
    }

    _isLoading = false;
    loaderController.showLoaderAfterBuild(_isLoading);

    update();
  }

  Future<bool> orderAssign(Map<String, dynamic> body) async {
    _isLoading = true;
    loaderController.showLoaderAfterBuild(_isLoading);

    update();

    Response? response = await orderRepo.orderCreate(body);
    _isLoading = false;
    loaderController.showLoaderAfterBuild(_isLoading);

    update();

    if (response != null && response.statusCode == 200) {
      selectDeliveryDate.clear();
      selectedSupplier = null;
      SupplierId = null;
      comment.clear();
      return true;
    } else {
      print('Invalid User');
      return false;
    }
  }

  Future<void> OrderCancelStatus({Map<String, dynamic>? body}) async {
    _isLoading = true;
    loaderController.showLoaderAfterBuild(_isLoading);

    update();

    // Map<String, dynamic> body = {
    //   "cancel_reason": "Any",
    //   "detail_id": "78",
    //   "id_job_order_detail": "54",
    //   "status": 6
    // };

    Response? response = await orderRepo.orderUpdateStatus([body]);
    if (response != null && response.statusCode == 200) {
      customSnackBar('Job Orders Status Updated successfully', isError: false);
    } else {
      print('Invalid User');
    }

    _isLoading = false;
    loaderController.showLoaderAfterBuild(_isLoading);

    update();
  }

  Future<void> OrderCompleteStatus({Map<String, dynamic>? body}) async {
    _isLoading = true;
    loaderController.showLoaderAfterBuild(_isLoading);

    update();

    // Map<String, dynamic> body = {
    //   "detail_id": "73",
    //   "added_through": 2,
    //   "id_job_order_detail": "19",
    //   "status": 4 // 4 = Complete, 5 = Delivered
    // };

    Response? response = await orderRepo.orderUpdateStatus([body]);
    if (response != null && response.statusCode == 200) {
      customSnackBar('Job Orders Status Updated successfully', isError: false);
    } else {
      print('Invalid User');
    }

    _isLoading = false;
    loaderController.showLoaderAfterBuild(_isLoading);

    update();
  }
}
