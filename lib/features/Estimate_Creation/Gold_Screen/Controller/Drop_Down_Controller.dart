import 'package:get/get.dart';

class DropdownController extends GetxController {
  var selectedEmployeeId = 1.obs;

  final employeeList = [
    {'id': 1, 'name': 'Ring'},
    {'id': 2, 'name': 'Gold'},
  ];

  void updateSelectedEmployee(int? id) {
    if (id != null) {
      selectedEmployeeId.value = id;
    }
  }
}
