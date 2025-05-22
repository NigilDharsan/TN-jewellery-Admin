import 'package:flutter/material.dart';
import 'package:tn_jewellery_admin/utils/colors.dart';

class StoneDetailsPage extends StatefulWidget {
  const StoneDetailsPage({super.key});

  @override
  State<StoneDetailsPage> createState() => _StoneDetailsPageState();
}

class _StoneDetailsPageState extends State<StoneDetailsPage> {
  int? selectedEmployeeId;
  bool isSwitched = false;

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
                    Expanded(child: buildDropdown(title: "STONE MATERIAL")),
                    Expanded(child: buildDropdown(title: "STONE WEIGHT")),
                  ],
                ),
                Row(
                  children: [
                    Expanded(child: buildDropdown(title: "PURITY")),
                    Expanded(child: buildDropdown(title: "QUALITY CODE")),
                  ],
                ),
                Row(
                  children: [
                    Expanded(child: buildDropdown(title: "NO.OF.PCS")),
                    Expanded(child: buildDropdown(title: "LESS WEIGHT")),
                  ],
                ),
                Row(
                  children: [
                    Expanded(child: buildTextField(title: "AMOUNT", hint: "4500"),),
                    Expanded(child:buildTextField(title: "RATE", hint: "5000"),),
                  ],
                ),

              ],
            ),
            const SizedBox(height: 20),
            GestureDetector(
              onTap: () {
                // Handle tag number tap
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

  Widget buildDropdown({required String title}) {
    final employeeList = [
      {'id': 1, 'name': 'Ring'},
      {'id': 2, 'name': 'Gold'},
    ];

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
              color: brandGreyColor,
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
              child: DropdownButtonHideUnderline(
                child: DropdownButton<int>(
                  value: selectedEmployeeId,
                  icon: const Icon(Icons.keyboard_arrow_down),
                  dropdownColor: Colors.white,
                  style: const TextStyle(
                    fontFamily: 'JosefinSans',
                    color: brandGreySoftColor,
                    fontWeight: FontWeight.w400,
                    fontSize: 18,
                  ),
                  onChanged: (int? newId) {
                    setState(() {
                      selectedEmployeeId = newId;
                    });
                  },
                  items: employeeList.map((employee) {
                    return DropdownMenuItem<int>(
                      value: employee['id'] as int,
                      child: Text(employee['name'] as String),
                    );
                  }).toList(),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
