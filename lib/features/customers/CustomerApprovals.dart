import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:tn_jewellery_admin/features/dashboard/controller/dashboard_controller.dart';
import 'package:tn_jewellery_admin/utils/colors.dart';
import 'package:url_launcher/url_launcher.dart';

class CustomerNameList extends StatefulWidget {
  const CustomerNameList({super.key});

  @override
  State<CustomerNameList> createState() => _CustomerNameListState();
}

class _CustomerNameListState extends State<CustomerNameList>
    with SingleTickerProviderStateMixin {
  String isSelectButton = 'LifeTime';
  DateTime? selectedDateTime;
  late TabController _tabController;
  final List<String> _tabs = ['Yet to Approve', 'Rejected', 'Total Approved'];
  Map<int, Map<String, dynamic>> catalogSelections = {};
  Map<int, bool> editModes = {};
  bool isApprovalTab = true;

  Future<void> pickDateTime(int customerId) async {
    final date = await showDatePicker(
      context: context,
      initialDate: selectedDateTime ?? DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2100),
    );

    if (date != null) {
      final time = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.fromDateTime(selectedDateTime ?? DateTime.now()),
      );

      if (time != null) {
        setState(() {
          selectedDateTime =
              DateTime(date.year, date.month, date.day, time.hour, time.minute);
          catalogSelections[customerId] = {
            'show_catalogue': '1',
            'show_catalogue_date':
                DateFormat('yyyy-MM-dd HH:mm:ss').format(selectedDateTime!)
          };
        });
      } else {
        setState(() {
          isSelectButton = 'LifeTime';
          catalogSelections.remove(customerId);
        });
      }
    } else {
      setState(() {
        isSelectButton = 'LifeTime';
        catalogSelections.remove(customerId);
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: _tabs.length, vsync: this);
    _tabController.addListener(_handleTabChange);
    Get.find<DashboardController>().getCustomerList("1");
  }

  void _handleTabChange() {
    if (_tabController.indexIsChanging) return;

    final status = _getStatusByTabIndex(_tabController.index);
    Get.find<DashboardController>().getCustomerList(status.toString());
    setState(() {
      Get.find<DashboardController>().selectedCustomers.clear();

      editModes.clear(); // Clear all edit modes when changing tabs
    });
  }

  int _getStatusByTabIndex(int index) {
    switch (index) {
      case 0:
        return 1;
      case 1:
        return 3;
      case 2:
        return 2;
      default:
        return 1;

    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: brandGoldLightColor.withAlpha(80),
      appBar: AppBar(
        title: const Text('Customer Approval'),
        backgroundColor: brandGoldColor,
        bottom: TabBar(
          controller: _tabController,
          tabs: _tabs.map((label) => Tab(text: label)).toList(),
          labelColor: Colors.black,
          indicatorColor: Colors.black,
        ),
      ),
      body: GetBuilder<DashboardController>(
        autoRemove: false,
        builder: (controller) {
          return Column(
            children: [
              Expanded(
                child: TabBarView(
                  controller: _tabController,
                  children: [
                    _buildCustomerList(controller, statusFilter: 1),
                    _buildCustomerList(controller, statusFilter: 3),
                    _buildCustomerList(controller, statusFilter: 2),
                  ],
                ),
              ),
              if ((isApprovalTab || editModes.values.any((mode) => mode)) &&
                  controller.selectedCustomers.values.any((selected) => selected))
                BottomAppBar(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 1),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        if (_tabController.index == 0) ...[
                          InkWell(
                            onTap: () => _submitCustomerStatus(controller, 2),
                            child: _optionButton('Approve'),
                          ),
                          InkWell(
                            onTap: () => _submitCustomerStatus(controller, 3),
                            child: _optionButton('Reject'),
                          ),
                        ] else if (_tabController.index == 1) ...[
                          InkWell(
                            onTap: () => _submitCustomerStatus(controller, 2),
                            child: _optionButton('Approve'),
                          ),
                        ] else if (_tabController.index == 2) ...[
                          InkWell(
                            onTap: () => _submitCustomerStatus(controller, 3),
                            child: _optionButton('Update'),
                          ),
                        ],
                      ],
                    ),
                  ),
                ),

            ],
          );
        },
      ),
    );
  }

  Widget _buildCustomerList(DashboardController controller,
      {required int statusFilter}) {
    final customerList = controller.customerModel?.data ?? [];
    final isApprovalTab = statusFilter == 1;
    final isRejectedTab = statusFilter == 3;
    final isApprovedTab = statusFilter == 2;

    return Padding(
      padding: const EdgeInsets.all(20),
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: customerList.length,
              itemBuilder: (context, index) {
                final customer = customerList[index];
                final isSelected =
                    controller.selectedCustomers[customer.pkId] ?? false;
                final isEditing = editModes[customer.pkId] ?? false;


                return GestureDetector(
                  onTap: () {
                    final phone = customer.mobile ?? '';
                    if (phone.isNotEmpty) {
                      launchUrl(Uri.parse("tel:$phone"));
                    }
                  },
                  child: Card(
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 8, horizontal: 8),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          if (isApprovalTab || ((isRejectedTab || isApprovedTab) && isEditing))
                            Padding(
                              padding: const EdgeInsets.only(right: 2),
                              child: Checkbox(
                                value: isSelected,
                                onChanged: (bool? newValue) {
                                  setState(() {
                                    controller
                                            .selectedCustomers[customer.pkId!] =
                                        newValue!;
                                    if (!newValue) {
                                      catalogSelections.remove(customer.pkId);
                                      if (isEditing) {
                                        editModes[customer.pkId!] = false;
                                      }
                                    }
                                  });
                                },
                              ),
                            ),
                          Expanded(
                            child: Stack(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(right: 4),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Column(
                                        children: [
                                          Row(
                                            children: [
                                              Text(
                                                customer.name ?? 'No Name',
                                                style: const TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 16,
                                                  fontFamily: 'JosefinSans',
                                                ),
                                              ),
                                              const SizedBox(width: 2),
                                              Expanded(
                                             child:  Text(
                                                  ' - ${customer.companyName ?? ''}',
                                                  style: const TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 16,
                                                  fontFamily: 'JosefinSans',
                                                ),
                                              ),),
                                            ],
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 4),
                                      Text(
                                        customer.mobile ?? 'No Mobile',
                                        style: const TextStyle(
                                          fontSize: 16,
                                          fontFamily: 'JosefinSans',
                                          color: Colors.black54,
                                        ),
                                      ),
                                      const SizedBox(height: 4),
                                      Text(
                                        customer.gstNumber ?? '',
                                        style: const TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 15,
                                          fontFamily: 'JosefinSans',
                                        ),
                                      ),
                                      const SizedBox(height: 10),
                                      if ((isSelected &&
                                              (isApprovalTab ||
                                                  (isRejectedTab &&
                                                      isEditing) ||  (isApprovedTab &&
                                                  isEditing))) ||
                                          (isApprovedTab &&
                                              controller.selectedCustomers[
                                                      customer.pkId] ==
                                                  true))
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            const Text(
                                              'Show Catalogue',
                                              style: TextStyle(
                                                fontWeight: FontWeight.w500,
                                                fontSize: 15,
                                                fontFamily: 'JosefinSans',
                                              ),
                                            ),
                                            const SizedBox(height: 1),
                                            _buildCatalogOptions(
                                                customer.pkId!),
                                          ],
                                        ),
                                      /* if (isRejectedTab && !isEditing)
                                  _buildRejectedTab(customer, controller), */
                                      // if (isApprovedTab &&
                                      //     !(controller
                                      //             .selectedCustomers[customer.pkId] ??
                                      //         false))
                                      // _buildApprovedTab(customer, controller),
                                    ],
                                  ),
                                ),
                                if ((isRejectedTab || isApprovedTab) && !isEditing)
                                  Positioned(
                                    top: 30,
                                    right: 10,
                                    child: ElevatedButton.icon(
                                      icon: const Icon(Icons.edit, size: 18,color: Colors.black,),
                                      label: const Text('Edit',style: TextStyle(color: brandPrimaryColor,fontSize: 15,fontWeight:FontWeight.bold),),
                                      onPressed: () {
                                        setState(() {
                                          editModes[customer.pkId!] = true;
                                          controller.selectedCustomers[
                                              customer.pkId!] = true;
                                        });
                                      },
                                      style: ElevatedButton.styleFrom(
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(8)),
                                      ),
                                    ),
                                  ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
            // if ((isApprovalTab || editModes.values.any((mode) => mode)) &&
            //     controller.selectedCustomers.values.any((selected) => selected))
            //   Padding(
            //     padding: const EdgeInsets.only(top: 20),
            //     child: Row(
            //       mainAxisAlignment: MainAxisAlignment.spaceAround,
            //       children: [
            //         InkWell(
            //           onTap: () => _submitCustomerStatus(controller,  2),
            //           child: _optionButton('Approve'),
            //         ),
            //         if (isApprovalTab)
            //           InkWell(
            //             onTap: () => _submitCustomerStatus(controller, 3),
            //             child: _optionButton('Reject'),
            //           ),
            //       ],
            //     ),
            //   ),
          ],
        ),
      ),
    );
  }

  Widget _buildCatalogOptions(int customerId) {
    final currentSelection =
        catalogSelections[customerId]?['show_catalogue'] == '1'
            ? 'Limited'
            : 'LifeTime';

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Flexible(
              flex: 1,
              child: RadioListTile<String>(
                contentPadding: EdgeInsets.zero,
                title: const Text(
                  'LifeTime',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 15,
                    fontFamily: 'JosefinSans',
                  ),
                ),
                value: 'LifeTime',
                groupValue: currentSelection,
                onChanged: (value) {
                  setState(() {
                    catalogSelections.remove(customerId);
                  });
                },
              ),
            ),
            const SizedBox(width: 1),
            Flexible(
              flex: 1,
              child: RadioListTile<String>(
                contentPadding: EdgeInsets.zero,
                title: const Text(
                  'Limited',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 15,
                    fontFamily: 'JosefinSans',
                  ),
                ),
                value: 'Limited',
                groupValue: currentSelection,
                onChanged: (value) async {
                  await pickDateTime(customerId);
                },
              ),
            ),
          ],
        ),
        if (currentSelection == 'Limited' &&
            catalogSelections[customerId] != null)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 0),
            child: Text(
              'Show until : ${DateFormat('yyyy-MM-dd HH:mm:ss').format(selectedDateTime!)}',
              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
            ),
          ),
      ],
    );
  }

  // Widget _buildRejectedTab(customer, controller) {
  //   return Padding(
  //     padding: const EdgeInsets.only(right: 80),
  //     child: Stack(
  //       children: [
  //         const SizedBox(height: 40),
  //         /* TextButton(
  //           onPressed: () {
  //             setState(() {
  //               editModes[customer.pkId!] = true;
  //               controller.selectedCustomers[customer.pkId!] = true;
  //             });
  //           },
  //           child: const Text(
  //             'Edit',
  //             style: TextStyle(
  //               fontWeight: FontWeight.w500,
  //               fontSize: 15,
  //               fontFamily: 'JosefinSans',
  //             ),
  //           ),
  //         ), */
  //
  //         Align(
  //           alignment: Alignment.centerRight,
  //           child: ElevatedButton.icon(
  //             icon: const Icon(Icons.edit, size: 18),
  //             label: const Text(''),
  //             onPressed: () {
  //               setState(() {
  //                 editModes[customer.pkId!] = true;
  //                 controller.selectedCustomers[customer.pkId!] = true;
  //               });
  //             },
  //             style: ElevatedButton.styleFrom(
  //               shape: RoundedRectangleBorder(
  //                   borderRadius: BorderRadius.circular(8)),
  //             ),
  //           ),
  //         ),
  //       ],
  //     ),
  //   );
  // }
  //
  // Widget _buildApprovedTab(customer, DashboardController controller) {
  //   return Column(
  //     children: [
  //       Align(
  //         alignment: Alignment.topRight,
  //         child: TextButton(
  //           onPressed: () {
  //             setState(() {
  //               controller.selectedCustomers[customer.pkId!] = true;
  //             });
  //           },
  //           child: const Text(
  //             'Reject',
  //             style: TextStyle(
  //               fontWeight: FontWeight.w500,
  //               fontSize: 15,
  //               fontFamily: 'JosefinSans',
  //             ),
  //           ),
  //         ),
  //       ),
  //     ],
  //   );
  // }

  void _submitCustomerStatus(DashboardController controller, int status) {
    final List<Map<String, dynamic>> selectedIds = [];

    controller.selectedCustomers.forEach((customerId, isSelected) {
      if (isSelected) {
        final customerData = <String, dynamic>{'pk_id': customerId};

        if (catalogSelections.containsKey(customerId)) {
          customerData['show_catalogue'] =
              catalogSelections[customerId]!['show_catalogue'];
          customerData['show_catalogue_date'] =
              catalogSelections[customerId]!['show_catalogue_date'];
        }

        selectedIds.add(customerData);
      }
    });

    if (selectedIds.isEmpty) {
      Get.snackbar("No Selection", "Please select at least one customer.");
      return;
    }

    controller.postCustomerStatus({
      "approved_through": 2,
      "approved_status": status,
      "approve_ids": selectedIds,
    }).then((_) {
      final currentStatus = _getStatusByTabIndex(_tabController.index);
      controller.getCustomerList(currentStatus.toString());
      controller.selectedCustomers.clear();
      catalogSelections.clear();
      editModes.clear();
    });
  }

  Widget _optionButton(String text) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      decoration: BoxDecoration(
        color: brandGoldColor,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 6,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Text(
        text,
        style: const TextStyle(
          fontFamily: 'JosefinSans',
          fontWeight: FontWeight.bold,
          color: Colors.black,
          fontSize: 16,
        ),
      ),
    );
  }
}
