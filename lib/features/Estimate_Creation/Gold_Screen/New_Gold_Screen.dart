import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tn_jewellery_admin/features/Estimate_Creation/Gold_Screen/Controller/Drop_Down_Controller.dart';
import 'package:tn_jewellery_admin/features/Estimate_Creation/Gold_Screen/Stone_Details_Page.dart';
import 'package:tn_jewellery_admin/features/Estimate_Creation/Scan_Tag_Page/Estimate_details_Page1.dart';
import 'package:tn_jewellery_admin/utils/colors.dart';
import 'package:tn_jewellery_admin/utils/styles.dart';
import 'package:tn_jewellery_admin/utils/widgets/Common_drop_down_field.dart';

class NewGoldScreen extends StatefulWidget {
  const NewGoldScreen({super.key});

  @override
  State<NewGoldScreen> createState() => _NewGoldScreenState();
}

class _NewGoldScreenState extends State<NewGoldScreen> {
  int? selectedEmployeeId;
  bool isSwitched = false;
  final dropdownController = Get.put(DropdownController());

  @override
  void initState() {
    super.initState();
    selectedEmployeeId = 1;
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
        title: const Text('ADDING NEW PIECE',
            style: TextStyle(
                fontFamily: 'JosefinSans',
                fontSize: 18,
                color: brandGreyColor,
                fontWeight: FontWeight.bold)),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // Column(
            //   children: [
            //     Column(
            //       crossAxisAlignment: CrossAxisAlignment.start,
            //       children: [
            //         const SizedBox(height: 20),
            //         Row(
            //           children: [
            //             Expanded(
            //               child: CustomDropdown(
            //                 title: "PRODUCT",
            //                 selectedId: dropdownController.productSelected,
            //                 items: dropdownController.productItems,
            //               ),
            //             ),
            //             const SizedBox(width: 10),
            //             Expanded(
            //               child: CustomDropdown(
            //                 title: "DESIGN NAME",
            //                 selectedId: dropdownController.designSelected,
            //                 items: dropdownController.designItems,
            //               ),
            //             ),
            //           ],
            //         ),
            //         Row(
            //           children: [
            //             Expanded(
            //               child: CustomDropdown(
            //                 title: "PURITY",
            //                 selectedId: dropdownController.puritySelected,
            //                 items: dropdownController.purityItems,
            //               ),
            //             ),
            //             Expanded(
            //                 child: buildTextField(
            //                   title: "NO.OF.PSC",
            //                   hint: "1",
            //                   controller: dropdownController.pscController,
            //                 )),
            //           ],
            //         ),
            //         Row(
            //           children: [
            //             Expanded(
            //                 child: grossWeight(
            //                     title: "GROSS WEIGHT",
            //                     hint: "",
            //                     selectedId: dropdownController.grossSelected,
            //                     items: dropdownController.gross,
            //                     onTap: () {
            //                       Get.to(() => const StoneDetailsPage(),
            //                           arguments: {'showAddButton': true});
            //                     })),
            //             Expanded(
            //                 child: grossWeight(
            //                     title: "LESS WEIGHT",
            //                     selectedId: dropdownController.lessSelected,
            //                     items: dropdownController.less,
            //                     hint: "",
            //                     onTap: () {
            //                       Get.to(() => const StoneDetailsPage(),
            //                           arguments: {'showAddButton': true});
            //                     })),
            //             Expanded(
            //                 child: grossWeight(
            //                     title: "NET WEIGHT",
            //                     hint: "",
            //                     selectedId: dropdownController.netSelected,
            //                     items: dropdownController.net,
            //                     onTap: () {
            //                       Get.to(() => const StoneDetailsPage(),
            //                           arguments: {'showAddButton': true});
            //                     })),
            //           ],
            //         ),
            //         Row(
            //           children: [
            //             Expanded(
            //                 child: CustomDropdown(
            //                   title: "WASTAGE %",
            //                   selectedId: dropdownController.wastageSelected,
            //                   items: dropdownController.wastage,
            //                 )),
            //             Expanded(
            //                 child: buildTextField(
            //                   title: "MC PER",
            //                   hint: "1",
            //                   controller: dropdownController.mcController,
            //                 )),
            //           ],
            //         ),
            //         Row(
            //           children: [
            //             Expanded(
            //                 child: CustomDropdown(
            //                   title: "MAKING %",
            //                   selectedId: dropdownController.makingSelected,
            //                   items: dropdownController.making,
            //                 )),
            //             Expanded(
            //                 child: CustomDropdown(
            //                   title: "ITEM COST",
            //                   selectedId: dropdownController.costSelected,
            //                   items: dropdownController.cost,
            //                 )),
            //           ],
            //         ),
            //       ],
            //     ),
            //     SizedBox(height: 10),
            //     Row(
            //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //       crossAxisAlignment: CrossAxisAlignment.start,
            //       children: [
            //         Expanded(
            //           child: Row(
            //             children: [
            //               Text(
            //                 isSwitched ? 'STONE' : 'STONE',
            //                 style: tag1,
            //               ),
            //               SizedBox(width: 10),
            //               Switch(
            //                 value: isSwitched,
            //                 onChanged: (value) {
            //                   setState(() {
            //                     isSwitched = value;
            //                   });
            //                 },
            //                 activeColor: Colors.white,
            //                 inactiveThumbColor: Colors.white,
            //                 activeTrackColor: Colors.grey,
            //                 inactiveTrackColor: Colors.grey,
            //               )
            //             ],
            //           ),
            //         ),
            //         GestureDetector(
            //           onTap: () {
            //             Get.to(() => const StoneDetailsPage(),
            //                 arguments: {'showAddButton': true});
            //           },
            //           child: Container(
            //             height: 50,
            //             width: 50,
            //             decoration: BoxDecoration(
            //               color: brandGoldColor,
            //               shape: BoxShape.circle,
            //             ),
            //             child: const Center(
            //               child: Icon(Icons.add,
            //                   size: 30, color: Colors.white),
            //             ),
            //           ),
            //         ),
            //       ],
            //     ),
            //     const SizedBox(height: 20),
            //     Row(
            //       mainAxisAlignment: MainAxisAlignment.start,
            //       children: [
            //         Expanded(
            //           child: Column(
            //             children: [
            //               Column(
            //                 crossAxisAlignment: CrossAxisAlignment.start,
            //                 children: [
            //                   Text('Stone Name', style: tag2),
            //                   Text(
            //                     '${dropdownController.stoneSelected.value} GRAMS',
            //                     style: tag1,
            //                   )
            //                 ],
            //               ),
            //             ],
            //           ),
            //         ),
            //         Expanded(
            //           child: Column(
            //             children: [
            //               Column(
            //                 crossAxisAlignment: CrossAxisAlignment.start,
            //                 children: [
            //                   Text('Stone Weight', style: tag2),
            //                   Text(
            //                     '${dropdownController.weightSelected.value} GRAMS',
            //                     style: tag1,
            //                   )
            //                 ],
            //               ),
            //             ],
            //           ),
            //         ),
            //         Expanded(
            //           child: Column(
            //             children: [
            //               Column(
            //                 crossAxisAlignment: CrossAxisAlignment.start,
            //                 children: [
            //                   Text('Rate', style: tag2),
            //                   Text(
            //                     dropdownController.rateController.text.isEmpty
            //                         ? '0'
            //                         : dropdownController.rateController.text,
            //                     style: tag1,
            //                   )
            //                 ],
            //               ),
            //             ],
            //           ),
            //         ),
            //       ],
            //     ),
            //     Divider(
            //       color: brandGreySoftColor,
            //     ),
            //     Row(
            //       mainAxisAlignment: MainAxisAlignment.start,
            //       children: [
            //         Expanded(
            //           child: Column(
            //             children: [
            //               Column(
            //                 crossAxisAlignment: CrossAxisAlignment.start,
            //                 children: [
            //                   Text('Gross Weight', style: tag2),
            //                   Text(
            //                     '${dropdownController.grossSelected.value} GRAMS',
            //                     style: tag1,
            //                   )
            //                 ],
            //               ),
            //             ],
            //           ),
            //         ),
            //         Expanded(
            //           child: Column(
            //             children: [
            //               Column(
            //                 crossAxisAlignment: CrossAxisAlignment.start,
            //                 children: [
            //                   Text('Less Weight', style: tag2),
            //                   Text(
            //                     '${dropdownController.lessSelected.value} GRAMS',
            //                     style: tag1,
            //                   )
            //                 ],
            //               ),
            //             ],
            //           ),
            //         ),
            //         Expanded(
            //           child: Column(
            //             children: [
            //               Column(
            //                 crossAxisAlignment: CrossAxisAlignment.start,
            //                 children: [
            //                   Text('Net Weight', style: tag2),
            //                   Text(
            //                     '${dropdownController.netSelected.value} GRAMS',
            //                     style: tag1,
            //                   ),
            //                 ],
            //               ),
            //             ],
            //           ),
            //         ),
            //       ],
            //     ),
            //     const SizedBox(height: 20),
            //     GestureDetector(
            //       onTap: () {
            //         Get.to(EstimateDetailsPage1());
            //       },
            //       child: Container(
            //         padding: const EdgeInsets.all(12),
            //         decoration: BoxDecoration(
            //           borderRadius: BorderRadius.circular(8),
            //           border: Border.all(color: brandGoldColor),
            //         ),
            //         child: Row(
            //           mainAxisAlignment: MainAxisAlignment.center,
            //           crossAxisAlignment: CrossAxisAlignment.center,
            //           children: [
            //             Icon(Icons.add_box_outlined, color: Colors.white),
            //             Text('NEXT',
            //                 style: TextStyle(
            //                     fontFamily: 'JosefinSans',
            //                     fontSize: 16,
            //                     fontWeight: FontWeight.bold,
            //                     color: brandGoldColor)),
            //           ],
            //         ),
            //       ),
            //     ),
            //   ],
            // )
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                Row(
                  children: [
                    Expanded(
                      child: CustomDropdown(
                        title: "PRODUCT",
                        selectedId: dropdownController.productSelected,
                        items: dropdownController.productItems,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: CustomDropdown(
                        title: "DESIGN NAME",
                        selectedId: dropdownController.designSelected,
                        items: dropdownController.designItems,
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
                        child: buildTextField(
                          title: "NO.OF.PSC",
                          hint: "1",
                          controller: dropdownController.pscController,
                        )),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                        child: grossWeight(
                            title: "GROSS WEIGHT",
                            hint: "",
                            selectedId: dropdownController.grossSelected,
                            items: dropdownController.gross,
                            onTap: () {
                              Get.to(() => const StoneDetailsPage(),
                                  arguments: {'showAddButton': true});
                            })),
                    Expanded(
                        child: grossWeight(
                            title: "LESS WEIGHT",
                            selectedId: dropdownController.lessSelected,
                            items: dropdownController.less,
                            hint: "",
                            onTap: () {
                              Get.to(() => const StoneDetailsPage(),
                                  arguments: {'showAddButton': true});
                            })),
                    Expanded(
                        child: grossWeight(
                            title: "NET WEIGHT",
                            hint: "",
                            selectedId: dropdownController.netSelected,
                            items: dropdownController.net,
                            onTap: () {
                              Get.to(() => const StoneDetailsPage(),
                                  arguments: {'showAddButton': true});
                            })),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                        child: CustomDropdown(
                          title: "WASTAGE %",
                          selectedId: dropdownController.wastageSelected,
                          items: dropdownController.wastage,
                        )),
                    Expanded(
                        child: buildTextField(
                          title: "MC PER",
                          hint: "1",
                          controller: dropdownController.mcController,
                        )),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                        child: CustomDropdown(
                          title: "MAKING %",
                          selectedId: dropdownController.makingSelected,
                          items: dropdownController.making,
                        )),
                    Expanded(
                        child: CustomDropdown(
                          title: "ITEM COST",
                          selectedId: dropdownController.costSelected,
                          items: dropdownController.cost,
                        )),
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Row(
                        children: [
                          Text(
                            isSwitched ? 'STONE' : 'STONE',
                            style: tag1,
                          ),
                          SizedBox(width: 10),
                          Switch(
                            value: isSwitched,
                            onChanged: (value) {
                              setState(() {
                                isSwitched = value;
                              });
                            },
                            activeColor: Colors.white,
                            inactiveThumbColor: Colors.white,
                            activeTrackColor: Colors.grey,
                            inactiveTrackColor: Colors.grey,
                          )
                        ],
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.to(() => const StoneDetailsPage(),
                            arguments: {'showAddButton': true});
                      },
                      child: Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                          color: brandGoldColor,
                          shape: BoxShape.circle,
                        ),
                        child: const Center(
                          child: Icon(Icons.add,
                              size: 30, color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Obx(() {
              return ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: dropdownController.inputSets.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Column(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Stone Name', style: tag2),
                                    Text(
                                      '${dropdownController.stoneSelected.value}',
                                      style: tag1,
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Column(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Stone Weight', style: tag2),
                                    Text(
                                      '${dropdownController.weightSelected.value} GRAMS',
                                      style: tag1,
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Column(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Rate', style: tag2),
                                    Text(
                                      dropdownController.rateController.text.isEmpty
                                          ? '0'
                                          : dropdownController.rateController.text,
                                      style: tag1,
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Divider(
                        color: brandGreySoftColor,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Column(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Gross Weight', style: tag2),
                                    Text(
                                      '${dropdownController.grossSelected.value} GRAMS',
                                      style: tag1,
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Column(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Less Weight', style: tag2),
                                    Text(
                                      '${dropdownController.lessSelected.value} GRAMS',
                                      style: tag1,
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Column(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Net Weight', style: tag2),
                                    Text(
                                      '${dropdownController.netSelected.value} GRAMS',
                                      style: tag1,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  );
                },
              );
            }),
            const SizedBox(height: 20),
            GestureDetector(
              onTap: () {
                Get.to(EstimateDetailsPage1());
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
                    Text('NEXT',
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
