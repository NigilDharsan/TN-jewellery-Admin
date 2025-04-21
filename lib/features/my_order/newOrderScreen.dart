import 'package:flutter/material.dart';
import 'package:tn_jewellery_admin/utils/colors.dart';

class newOrderScreen extends StatefulWidget {
  const newOrderScreen({super.key});

  @override
  State<newOrderScreen> createState() => _newOrderScreenState();
}

class _newOrderScreenState extends State<newOrderScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 100),
            Container(
              height: 500,
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.grey[400],
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 20),
                  Text("Select Karikar",
                      style: TextStyle(
                          fontFamily: 'JosefinSans',
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.bold)),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          height: 40,
                          decoration: BoxDecoration(
                            color: secondaryColor,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: const [
                                Text(
                                  "VIKAS JOB WORK",
                                  style: TextStyle(
                                      fontFamily: 'JosefinSans',
                                      color: brandGoldColor,
                                      fontWeight: FontWeight.w700,
                                      fontSize: 18),
                                ),
                                SizedBox(width: 8),
                                Icon(
                                  Icons.keyboard_arrow_down,
                                  color: Colors.black,
                                  size: 30,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 30),
                  Text("Required Delivery Date",
                      style: TextStyle(
                          fontFamily: 'JosefinSans',
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.bold)),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          height: 40,
                          decoration: BoxDecoration(
                            color: secondaryColor,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: const [
                                Text(
                                  "12/12/2025",
                                  style: TextStyle(
                                      fontFamily: 'JosefinSans',
                                      color: brandGoldColor,
                                      fontWeight: FontWeight.w700,
                                      fontSize: 18),
                                ),
                                SizedBox(width: 8),
                                Icon(
                                  Icons.calendar_today,
                                  color: Colors.black,
                                  size: 30,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 30),
                  Text("Your comments",
                      style: TextStyle(
                          fontFamily: 'JosefinSans',
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.bold)),
                  SizedBox(height: 20),
                  Container(
                    height: 100,
                    decoration: BoxDecoration(
                      color: secondaryColor,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        maxLines: 5,
                        decoration: InputDecoration(
                          hintText:
                          "Some Text describing the changes the cusopmer looking for the retailer",
                          hintStyle: TextStyle(
                              fontFamily: 'JosefinSans',
                              color: Colors.black,
                              fontSize: 13,
                              fontWeight: FontWeight.w500),
                          border: InputBorder.none,
                          contentPadding:
                          const EdgeInsets.symmetric(horizontal: 10),
                        ),
                        style: const TextStyle(color: Colors.black),
                      ),
                    ),
                  ),
                  SizedBox(height: 40),
                  GestureDetector(
                    onTap: () {

                    },
                    child: Container(
                      height: 50,
                      decoration: BoxDecoration(
                        color: brandGoldColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                        child: Text(
                          "ASSIGN TO KARIKAR",
                          style: const TextStyle(
                            fontFamily: 'JosefinSans',
                            color: secondaryColor,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),

                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}