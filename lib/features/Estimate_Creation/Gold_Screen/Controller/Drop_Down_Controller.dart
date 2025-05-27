import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DropdownController extends GetxController {
  final RxInt productSelected = 0.obs;
  final RxInt puritySelected = 0.obs;
  final RxInt designSelected = 0.obs;
  final RxInt wastageSelected = 0.obs;
  final RxInt makingSelected = 0.obs;
  final RxInt costSelected = 0.obs;
  final RxInt lessSelected = 0.obs;
  final RxInt stoneSelected = 0.obs;
  final RxInt weightSelected = 0.obs;
  final RxInt qualitySelected = 0.obs;
  final RxInt noSelected = 0.obs;
  final RxInt typeSelected = 0.obs;
  final RxInt touchSelected = 0.obs;
  final RxInt dustSelected = 0.obs;
  final RxInt rateSelected = 0.obs;
  final RxInt grossSelected = 0.obs;
  final RxInt netSelected = 0.obs;
  final RxInt mcSelected = 0.obs;
  final RxInt amountSelected = 0.obs;
  final RxInt totalSelected = 0.obs;

  TextEditingController pscController = TextEditingController();
  TextEditingController mcController = TextEditingController();
  TextEditingController productController = TextEditingController();
  TextEditingController noController = TextEditingController();
  TextEditingController rateController = TextEditingController();
  TextEditingController amountController = TextEditingController();





  final List<Map<String, dynamic>> productItems = [
    {'id': 1, 'name': 'Ring'},
    {'id': 2, 'name': 'Gold'},
  ];

  final List<Map<String, dynamic>> purityItems = [
    {'id': 1, 'name': 'Purity 1'},
    {'id': 2, 'name': 'Purity 2'},
  ];

  final List<Map<String, dynamic>> designItems = [
    {'id': 1, 'name': 'Design 1'},
    {'id': 2, 'name': 'Design 2'},
  ];
  final List<Map<String, dynamic>> wastage = [
    {'id': 1, 'name': 'Wastage 1'},
    {'id': 2, 'name': 'Wastage 2'},
  ];
  final List<Map<String, dynamic>> making = [
    {'id': 1, 'name': 'Making 1'},
    {'id': 2, 'name': 'Making 2'},
  ];
  final List<Map<String, dynamic>> cost = [
    {'id': 1, 'name': 'Item Cost 1'},
    {'id': 2, 'name': 'Item Cost 2'},
  ];
  final List<Map<String, dynamic>> less = [
    {'id': 1, 'name': '1 gram'},
    {'id': 2, 'name': '2 gram'},
  ];
  final List<Map<String, dynamic>> weight = [
    {'id': 1, 'name': 'weight 1'},
    {'id': 2, 'name': 'weight 2'},
  ];
  final List<Map<String, dynamic>> stone = [
    {'id': 1, 'name': 'Ring'},
    {'id': 2, 'name': 'Gold'},
  ];
  final List<Map<String, dynamic>> no = [
    {'id': 1, 'name': '1'},
    {'id': 2, 'name': '2'},
  ];
  final List<Map<String, dynamic>> quality = [
    {'id': 1, 'name': 'Less weight 1'},
    {'id': 2, 'name': 'Less weight 2'},
  ];
  final List<Map<String, dynamic>> type = [
    {'id': 1, 'name': 'type 1'},
    {'id': 2, 'name': 'type 2'},
  ];
  final List<Map<String, dynamic>> touch = [
    {'id': 1, 'name': 'Ring'},
    {'id': 2, 'name': 'Gold'},
  ];
  final List<Map<String, dynamic>> dust = [
    {'id': 1, 'name': '1'},
    {'id': 2, 'name': '2'},
  ];
  final List<Map<String, dynamic>> rate = [
    {'id': 1, 'name': '1 gram'},
    {'id': 2, 'name': '2 gram'},
  ];
  final List<Map<String, dynamic>> gross = [
    {'id': 1, 'name': '1 gram'},
    {'id': 2, 'name': '2 gram'},
  ];
  final List<Map<String, dynamic>> mc = [
    {'id': 1, 'name': '1 gram'},
    {'id': 2, 'name': '2 gram'},
  ];
  final List<Map<String, dynamic>> net = [
    {'id': 1, 'name': '1 gram'},
    {'id': 2, 'name': '2 gram'},
  ];
  final List<Map<String, dynamic>> total = [
    {'id': 1, 'name': '1 gram'},
    {'id': 2, 'name': '2 gram'},
  ];
  final List<Map<String, dynamic>> amount = [
    {'id': 1, 'name': '1 gram'},
    {'id': 2, 'name': '2 gram'},
  ];
}
