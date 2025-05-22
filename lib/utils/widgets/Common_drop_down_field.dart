import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tn_jewellery_admin/features/Estimate_Creation/Gold_Screen/Controller/Drop_Down_Controller.dart';
import 'package:tn_jewellery_admin/utils/colors.dart';
import 'package:tn_jewellery_admin/utils/styles.dart';

class CustomDropdown extends StatelessWidget {
  final String title;

  CustomDropdown({required this.title});

  final DropdownController controller = Get.put(DropdownController());

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontFamily: 'JosefinSans',
              fontSize: 14,
              color: Colors.grey,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 8),
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.grey[100],
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Colors.white, width: 2),
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 5,
                  offset: Offset(0, 1),
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Obx(() => DropdownButtonHideUnderline(
                child: DropdownButton<int>(
                  value: controller.selectedEmployeeId.value,
                  icon: const Icon(Icons.keyboard_arrow_down),
                  dropdownColor: Colors.white,
                  style: tag2,
                  onChanged: controller.updateSelectedEmployee,
                  items: controller.employeeList.map((employee) {
                    return DropdownMenuItem<int>(
                      value: employee['id'] as int,
                      child: Text(employee['name'] as String),
                    );
                  }).toList(),
                ),
              )),
            ),
          ),
        ],
      ),
    );
  }
}

Widget buildTextField({required String title, required String hint}) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
              fontFamily: 'JosefinSans',
              fontSize: 18,
              color: brandGreyColor,
              fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.grey[100],
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Colors.white, width: 2),
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 5,
                offset: Offset(0, 1),
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: TextField(
              style: const TextStyle(
                fontFamily: 'JosefinSans',
                color: brandGreySoftColor,
                fontWeight: FontWeight.w700,
                fontSize: 15,
              ),
              decoration: InputDecoration(
                hintText: hint,
                hintStyle: const TextStyle(
                  fontFamily: 'JosefinSans',
                  color: brandGreySoftColor,
                ),
                border: InputBorder.none,
              ),
            ),
          ),
        ),
      ],
    ),
  );
}
