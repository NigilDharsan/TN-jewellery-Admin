import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:tn_jewellery_admin/utils/colors.dart';
import 'package:tn_jewellery_admin/utils/core/helper/route_helper.dart';


Widget buildTabButton(String title, bool isSelected, VoidCallback onPressed) {
  return ElevatedButton(
    style: ElevatedButton.styleFrom(
      backgroundColor: isSelected ? const Color(0xFF8D3D5B) : Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      padding: const EdgeInsets.symmetric(vertical: 12), // Responsive vertical padding
    ),
    onPressed: onPressed,
    child: Text(
      title,
      style: TextStyle(
        fontFamily: 'JosefinSans',
        fontSize: 16,
        fontWeight: FontWeight.bold,
        color: isSelected ? Colors.white : Colors.black,
      ),
      textAlign: TextAlign.center,
    ),
  );
}

Widget buildOrderCard(Map<String, String> order) {
  return InkWell(
    onTap: () {
      Get.toNamed(RouteHelper.orderdetailScreen);
    },
    child: Column(
      children: [
        Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(
                order["image"]!,
                width: 60,
                height: 60,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) =>
                const Icon(Icons.error),
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) return child;
                  return const SizedBox(
                    width: 60,
                    height: 60,
                    child: Center(
                        child: CircularProgressIndicator(strokeWidth: 2)),
                  );
                },
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(order["name"] ?? "",
                      style: const TextStyle(
                          fontFamily: 'JosefinSans',
                          fontWeight: FontWeight.bold, fontSize: 16)),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(order["product"] ?? ""),
                      Text(order["gram"] ?? ""),
                      Text(order["percentage"] ?? ""),
                    ],
                  ),
                  const SizedBox(height: 10),
                  InkWell(
                    onTap: () {
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //       builder: (_) => const NewOrder_Seletion()),
                      // );
                    },
                    child: Container(
                      height: 40,
                      width: 150,
                      decoration: BoxDecoration(
                        color: brandGoldDarkColor,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 10),
                          child: Text(
                            order["status"] ?? "",
                            style: const TextStyle(
                              fontFamily: 'JosefinSans',
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        const Divider(thickness: 1, color: Colors.grey),
      ],
    ),
  );
}