import 'package:flutter/material.dart';
import 'package:tn_jewellery_admin/utils/colors.dart';

class OrdersDropDown extends StatefulWidget {
  const OrdersDropDown({super.key});

  @override
  State<OrdersDropDown> createState() => _OrdersDropDownState();
}

class _OrdersDropDownState extends State<OrdersDropDown> {
  final TextEditingController _searchController = TextEditingController();

  List<String> formDetails = ['Gold', 'Ring', 'Jewels', 'Carat', 'Diamond'];
  List<String> filteredList = [];

  @override
  void initState() {
    super.initState();
    filteredList = formDetails;
    _searchController.addListener(_filterList);
  }

  void _filterList() {
    final query = _searchController.text.toLowerCase();
    setState(() {
      filteredList = formDetails
          .where((item) => item.toLowerCase().contains(query))
          .toList();
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
     title: Text(
        ' Search Karikar',
        style: TextStyle(
          fontFamily: 'JosefinSans',
          fontWeight: FontWeight.bold,
          color: brandPrimaryColor,
          fontSize: 18,
        ),
      )
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            TextFormField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: 'Search',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: filteredList.length,
                itemBuilder: (context, index) {
                  return Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    elevation: 3,
                    margin: const EdgeInsets.symmetric(vertical: 6),
                    child: ListTile(
                      leading: const Icon(Icons.person),
                      title: Text(filteredList[index]),
                      subtitle: Text("data"),
                      
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
