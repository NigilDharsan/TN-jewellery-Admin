import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tn_jewellery_admin/utils/colors.dart';

class CustomDropdown extends StatelessWidget {
  final String title;
  final RxInt selectedId;
  final List<Map<String, dynamic>> items;


  CustomDropdown({
    required this.title,
    required this.selectedId,
    required this.items,

  });

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
          Obx(() {
            final selectedValue = selectedId.value;
            final dropdownItems = items.map((item) {
              return DropdownMenuItem<int>(
                value: item['id'] as int,
                child: Text(item['name'],style: TextStyle(color: brandGreySoftColor),),
              );
            }).toList();

            final isValid = dropdownItems.where((e) => e.value == selectedValue).length == 1;
            final safeValue = isValid ? selectedValue : null;

            return Container(
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
                padding: const EdgeInsets.symmetric(horizontal: 1),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton2<int>(
                    isExpanded: true,
                    value: safeValue,
                    hint: const Text("Select",style: TextStyle(color: brandGreySoftColor,fontWeight: FontWeight.w500),),
                    buttonStyleData: const ButtonStyleData(
                      padding: EdgeInsets.symmetric(horizontal: 1),
                      height: 50,
                    ),
                    iconStyleData: const IconStyleData(
                      icon: Icon(Icons.keyboard_arrow_down),
                    ),
                    dropdownStyleData: const DropdownStyleData(
                      decoration: BoxDecoration(color: Colors.white),
                    ),
                    onChanged: (int? newValue) {
                      if (newValue != null) {
                        selectedId.value = newValue;
                      }
                    },
                    items: dropdownItems,
                  ),
                ),
              ),
            );
          }),
        ],
      ),
    );
  }
}


Widget buildTextField({required String title, required String hint,
  required TextEditingController controller,}) {
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
              controller: controller,
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
  required RxInt selectedId,
  required List<Map<String, dynamic>> items,
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
          child:
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
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
            child: Text(
              items.firstWhere(
                (item) => item['id'] == selectedId.value,
                orElse: () => {'name': hint},
              )['name'] ?? hint,
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



