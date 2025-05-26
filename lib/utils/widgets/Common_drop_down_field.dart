import 'package:dropdown_button2/dropdown_button2.dart';
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
          Row(
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontFamily: 'JosefinSans',
                  fontSize: 13,
                  color: brandGreyColor,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
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
                      child: DropdownButton2<int>(
                        isExpanded: true,
                        value: controller.selectedEmployeeId.value != 0
                            ? controller.selectedEmployeeId.value
                            : null,
                        hint: const Text("Select Employee"),
                        buttonStyleData: const ButtonStyleData(
                          padding: EdgeInsets.symmetric(horizontal: 1),
                          height: 50,
                        ),
                        iconStyleData: const IconStyleData(
                          icon: Icon(Icons.keyboard_arrow_down),
                        ),
                        dropdownStyleData: const DropdownStyleData(
                          decoration: BoxDecoration(
                            color: Colors.white,
                          ),
                        ),
                        style: tag2,
                        onChanged: (int? newValue) {
                          if (newValue != null) {
                            controller.updateSelectedEmployee(newValue);
                          }
                        },
                        items: controller.employeeList.map((employee) {
                          return DropdownMenuItem<int>(
                            value: employee['id'] as int,
                            child: Text(employee['name'] as String),
                          );
                        }).toList(),
                      ),
                    )),
              )
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
        Row(
          children: [
            Text(
              title,
              style: const TextStyle(
                  fontFamily: 'JosefinSans',
                  fontSize: 13,
                  color: brandGreyColor,
                  fontWeight: FontWeight.w600),
            ),
          ],
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

Widget grossWeight({
  required String title,
  required String hint,
  required VoidCallback onTap,
}) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontFamily: 'JosefinSans',
            fontSize: 13,
            color: brandGreyColor,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 8),
        GestureDetector(
          onTap: onTap,
          child: Container(
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
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
            child: Text(
              hint,
              style: const TextStyle(
                fontFamily: 'JosefinSans',
                color: brandGreySoftColor,
                fontWeight: FontWeight.w700,
                fontSize: 15,
              ),
            ),
          ),
        ),
      ],
    ),
  );
}
