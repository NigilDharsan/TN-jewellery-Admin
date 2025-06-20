import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tn_jewellery_admin/features/Estimate_Creation/Gold_Screen/Controller/Drop_Down_Controller.dart';
import 'package:tn_jewellery_admin/features/Estimate_Creation/Gold_Screen/New_Gold_Screen.dart';
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
  final dropdownController = Get.put(DropdownController());

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
                      Expanded(
                          child: CustomDropdown(
                        title: "STONE NAME",
                            selectedId: dropdownController.stoneSelected,
                            items: dropdownController.stone,
                      )),
                      Expanded(
                        child: CustomDropdown(
                          title: "STONE WEIGHT",
                          selectedId: dropdownController.weightSelected,
                          items: dropdownController.weight,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: CustomDropdown(
                          title: "PURITY",
                          selectedId: dropdownController.puritySelected,
                          items: dropdownController.purityItems,
                        ),
                      ),
                      Expanded(
                        child: CustomDropdown(
                          title: "QUALITY CODE",
                          selectedId: dropdownController.qualitySelected,
                          items: dropdownController.quality,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                          child: buildTextField(
                        title: "NO.OF.PSC",
                        hint: "1",
                        controller: dropdownController.pscController,
                      )),
                      Expanded(
                        child: CustomDropdown(
                          title: "LESS WEIGHT",
                          selectedId: dropdownController.lessSelected,
                          items: dropdownController.less,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: CustomDropdown(
                          title: "GROSS WEIGHT",
                          selectedId: dropdownController.grossSelected,
                          items: dropdownController.gross,
                        ),
                      ),
                      Expanded(
                        child: CustomDropdown(
                          title: "NET WEIGHT",
                          selectedId: dropdownController.netSelected,
                          items: dropdownController.net,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: buildTextField(
                          title: "AMOUNT",
                          hint: "4500",
                          controller: dropdownController.amountController,
                        ),
                      ),
                      Expanded(
                        child: buildTextField(
                          title: "RATE",
                          hint: "5000",
                          controller: dropdownController.rateController,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              // Obx(() {
              //   return Column(
              //     children: List.generate(dropdownController.inputSets.length,
              //         (index) {
              //       final input = dropdownController.inputSets[index];
              //       return Column(
              //         crossAxisAlignment: CrossAxisAlignment.start,
              //         children: [
              //           const SizedBox(height: 20),
              //           Row(
              //             children: [
              //               Expanded(
              //                   child: CustomDropdown(
              //                 title: "STONE NAME",
              //                 selectedId: input.stoneSelected,
              //                 items: dropdownController.stone,
              //               )),
              //               Expanded(
              //                 child: CustomDropdown(
              //                   title: "STONE WEIGHT",
              //                   selectedId: input.weightSelected,
              //                   items: dropdownController.weight,
              //                 ),
              //               ),
              //               if (index != 0)
              //                 IconButton(
              //                   icon: Icon(Icons.delete, color: Colors.red),
              //                   onPressed: () =>
              //                       dropdownController.removeInputSet(index),
              //                 ),
              //             ],
              //           ),
              //           Row(
              //             children: [
              //               Expanded(
              //                 child: CustomDropdown(
              //                   title: "PURITY",
              //                   selectedId: input.puritySelected,
              //                   items: dropdownController.purityItems,
              //                 ),
              //               ),
              //               Expanded(
              //                 child: CustomDropdown(
              //                   title: "QUALITY CODE",
              //                   selectedId: input.qualitySelected,
              //                   items: dropdownController.quality,
              //                 ),
              //               ),
              //             ],
              //           ),
              //           Row(
              //             children: [
              //               Expanded(
              //                   child: buildTextField(
              //                 title: "NO.OF.PSC",
              //                 hint: "1",
              //                 controller: input.pscController,
              //               )),
              //               Expanded(
              //                 child: CustomDropdown(
              //                   title: "LESS WEIGHT",
              //                   selectedId: input.lessSelected,
              //                   items: dropdownController.less,
              //                 ),
              //               ),
              //             ],
              //           ),
              //           Row(
              //             children: [
              //               Expanded(
              //                 child: CustomDropdown(
              //                   title: "GROSS WEIGHT",
              //                   selectedId: input.grossSelected,
              //                   items: dropdownController.gross,
              //                 ),
              //               ),
              //               Expanded(
              //                 child: CustomDropdown(
              //                   title: "NET WEIGHT",
              //                   selectedId: input.netSelected,
              //                   items: dropdownController.net,
              //                 ),
              //               ),
              //             ],
              //           ),
              //           Row(
              //             children: [
              //               Expanded(
              //                 child: buildTextField(
              //                   title: "AMOUNT",
              //                   hint: "4500",
              //                   controller: input.amountController,
              //                 ),
              //               ),
              //               Expanded(
              //                 child: buildTextField(
              //                   title: "RATE",
              //                   hint: "5000",
              //                   controller: input.rateController,
              //                 ),
              //               ),
              //             ],
              //           ),
              //         ],
              //       );
              //     }),
              //   );
              // }),
              const SizedBox(height: 20),
              if (showAddButton)
                GestureDetector(
                  onTap: () {
                    dropdownController.addInputSet();
                    Get.to(NewGoldScreen());
                  },
                  child: Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: brandGoldColor),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(Icons.add_box_outlined, color: Colors.white),
                        SizedBox(width: 8),
                        Text(
                          'ADD NOW',
                          style: TextStyle(
                            fontFamily: 'JosefinSans',
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: brandGoldColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
            ],
          ),
        ));
  }
}
