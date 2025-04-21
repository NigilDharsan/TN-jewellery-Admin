import 'package:flutter/material.dart';
import 'package:tn_jewellery_admin/utils/colors.dart';

Widget buildSelectButton() {
  return Center(
    child: SizedBox(
      width: 235,
      height: 50,
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          side: const BorderSide(color: buttonTextColor),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
        onPressed: () {},
        child: const Text('SELECT KARIKAR',
            style: TextStyle(
                fontFamily: 'JosefinSans',
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: brandGoldColor)),
      ),
    ),
  );
}

Widget buildChangeStatus() {
  return Center(
    child: SizedBox(
      width: 235,
      height: 50,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: brandGoldColor,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
        onPressed: () async {},
        child: const Text('CHANGE STATUS',
            style: TextStyle(
                fontFamily: 'JosefinSans',
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: secondaryColor)),
      ),
    ),
  );
}

