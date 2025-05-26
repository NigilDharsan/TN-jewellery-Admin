import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tn_jewellery_admin/features/Estimate_Creation/Gold_Screen/New_Gold_Screen.dart';
import 'package:tn_jewellery_admin/features/Estimate_Creation/Gold_Screen/Old_Gold_Screen.dart';
import 'package:tn_jewellery_admin/utils/colors.dart';
import 'package:tn_jewellery_admin/utils/widgets/Common_drop_down_field.dart';

class StoneDetailsPage extends StatefulWidget {
  const StoneDetailsPage({super.key});

  @override
  State<StoneDetailsPage> createState() => _StoneDetailsPageState();
}

class _StoneDetailsPageState extends State<StoneDetailsPage> {
  int? selectedEmployeeId;
  bool isSwitched = false;
  late bool showAddButton;
  @override
  void initState() {
    super.initState();
    selectedEmployeeId = 1;
    final args = Get.arguments as Map<String, dynamic>?;
    showAddButton = args?['showAddButton'] ?? false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_sharp),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.clear),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                Row(
                  children: [
                    Expanded(child: CustomDropdown(title: "STONE NAME")),
                    Expanded(child: CustomDropdown(title: "STONE WEIGHT")),
                  ],
                ),
                Row(
                  children: [
                    Expanded(child: CustomDropdown(title: "PURITY")),
                    Expanded(child: CustomDropdown(title: "QUALITY CODE")),
                  ],
                ),
                Row(
                  children: [
                    Expanded(child: CustomDropdown(title: "NO.OF.PCS")),
                    Expanded(child: CustomDropdown(title: "LESS WEIGHT")),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: buildTextField(title: "AMOUNT", hint: "4500"),
                    ),
                    Expanded(
                      child: buildTextField(title: "RATE", hint: "5000"),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 20),
            if (showAddButton)
            GestureDetector(
              onTap: () {
              Get.to( NewGoldScreen());
              },
              child: Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: brandGoldColor),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(Icons.add_box_outlined, color: Colors.white),
                    Text('ADD NOW',
                        style: TextStyle(
                            fontFamily: 'JosefinSans',
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: brandGoldColor)),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
