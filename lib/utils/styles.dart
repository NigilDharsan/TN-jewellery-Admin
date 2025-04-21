import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'colors.dart';
import 'dimensions.dart';

const appPadding = 16.0;

const robotoLight = TextStyle(
  fontFamily: 'Roboto',
  fontWeight: FontWeight.w300,
);

const robotoRegular = TextStyle(
  fontFamily: 'Roboto',
  fontWeight: FontWeight.w400,
);

const robotoMedium = TextStyle(
  fontFamily: 'Roboto',
  fontWeight: FontWeight.w500,
);

const robotoBold = TextStyle(
  fontFamily: 'Roboto',
  fontWeight: FontWeight.w700,
);

const robotoSemiBold = TextStyle(
  fontFamily: 'Roboto',
  fontWeight: FontWeight.w600,
);

const ubuntuLight = TextStyle(
  fontFamily: 'Ubuntu',
  fontWeight: FontWeight.bold,
);

const ubuntuRegular = TextStyle(
  fontFamily: 'Ubuntu',
  fontWeight: FontWeight.w400,
  fontSize: 16,
    color: Colors.black
);

const ubuntuMedium = TextStyle(
  fontFamily: 'Ubuntu',
  fontWeight: FontWeight.w500,
  fontSize: 15,
  color: Colors.black
);

const ubuntuBold = TextStyle(
  fontFamily: 'Ubuntu',
  fontWeight: FontWeight.bold,
  color: Colors.white,
  fontSize: 16,
);

const colorBold = TextStyle(
  fontFamily: 'Ubuntu',
  fontWeight: FontWeight.w500,
  color: Colors.black,
  fontSize: 14,
);

const rupees = TextStyle(
  fontFamily: 'Ubuntu',
  fontWeight: FontWeight.bold,
  color: Colors.black,
  fontSize: 15,
);

const level = TextStyle(
  fontFamily: 'Ubuntu',
  fontWeight: FontWeight.normal,
  color: Colors.black,
  fontSize: 15,
);
const conBold = TextStyle(
  fontFamily: 'Ubuntu',
  fontWeight: FontWeight.bold,
  color: Colors.white,
  fontSize: 15,
);
const con2Bold = TextStyle(
  fontFamily: 'Ubuntu',
  fontWeight: FontWeight.bold,
  color: Colors.white,
  fontSize: 18,
);

const nameBold = TextStyle(
  fontFamily: 'Ubuntu',
  fontWeight: FontWeight.bold,
  color: Colors.black,
  fontSize: 15,
);
const change = TextStyle(
  fontFamily: 'Ubuntu',
  fontWeight: FontWeight.w500,
  color: Colors.black,
  fontSize: 14,
);

const textBold = TextStyle(
  fontFamily: 'Ubuntu',
  fontWeight: FontWeight.w500,
  color: Colors.black,
  fontSize: 14,
);

const vertical = TextStyle(
  fontFamily: 'Ubuntu',
  fontWeight: FontWeight.w400,
  color: Colors.black,
  fontSize: 13,
);
const vertical1 = TextStyle(
  fontFamily: 'Ubuntu',
  fontWeight: FontWeight.w400,
  color: Colors.indigo,
  fontSize: 13,
);

const text1Bold = TextStyle(
  fontFamily: 'Ubuntu',
  fontWeight: FontWeight.bold,
  color: Colors.indigo,
  fontSize: 15,
);
const text2Bold = TextStyle(
  fontFamily: 'Ubuntu',
  fontWeight: FontWeight.bold,
  color: Colors.black,
  fontSize: 15,
);
const ubuntuSemiBold = TextStyle(
  fontFamily: 'Ubuntu',
  fontWeight: FontWeight.w500,
  fontSize: 13
);
const normalBold = TextStyle(
    fontFamily: 'Ubuntu',
    fontWeight: FontWeight.w600,
    fontSize: 13
);


const tripBold = TextStyle(
    fontFamily: 'Ubuntu',
    fontWeight: FontWeight.w400,
    fontSize: 15
);

const logBold = TextStyle(
    fontFamily: 'Ubuntu',
    fontWeight: FontWeight.w500,
    fontSize: 14
);
TextStyle order_style2 = TextStyle(
  fontFamily: 'JosefinSans',
  fontSize: 16,
  color: brandGreyColor,
  fontWeight: FontWeight.bold,
);
TextStyle order_style3 = TextStyle(
  fontFamily: 'JosefinSans',
  fontSize: 20,
  color: brandPrimaryColor,
  fontWeight: FontWeight.bold,
);

TextStyle jewellery_style = TextStyle(
  fontFamily: 'JosefinSans',
  fontSize: 16,
  color: brandGoldColor,
  fontWeight: FontWeight.bold,
);

const customer1 = TextStyle(
  fontFamily: 'JosefinSans',
  fontWeight: FontWeight.w700,
  color: brandGreyColor,
  fontSize: 16,
);
const customer2 = TextStyle(
  fontFamily: 'JosefinSans',
  fontWeight: FontWeight.w700,
  color: brandGreySoftColor,
  fontSize: 15,
);

//RADIO TEXT
TextStyle radio_T = TextStyle(
  fontFamily: 'Ubuntu',
  fontSize: 12,
  color: Colors.white,
  fontWeight: FontWeight.w400,
);
TextStyle radio_T_Black = TextStyle(
  fontFamily: 'Ubuntu',
  fontSize: 12,
  color: Colors.black,
  fontWeight: FontWeight.w400,
);


TextStyle radio_T_2 = TextStyle(
  fontFamily: 'Ubuntu',
  fontSize: 12,
  color: Colors.black,
  fontWeight: FontWeight.w400,
);

TextStyle popUp_fieldT = TextStyle(
  fontFamily: 'Ubuntu',
  fontSize: 11.5,
  color: Colors.black,
  fontWeight: FontWeight.w400,
);




//MARK LOCATION HINT STYLE
TextStyle Mark_Hint_Style = TextStyle(
  fontFamily: 'Ubuntu',
  fontSize: 15,
  color: Color.fromRGBO(0, 0, 0, 0.2),
  fontWeight: FontWeight.w500,
);

TextStyle Textfield_Style = TextStyle(
    fontFamily: 'Ubuntu',
    fontSize: 15,
    color: Colors.black,
    fontWeight: FontWeight.w400);

TextStyle Textfield_Style2 = TextStyle(
    fontFamily: 'Ubuntu',
    fontSize: 12.5,
    color: Colors.black,
    fontWeight: FontWeight.w400);





TextStyle StarT = TextStyle(color: Colors.red, fontSize: 20);

// List<BoxShadow>? searchBoxShadow = Get.isDarkMode ? null : [const BoxShadow(
//     offset: Offset(0,3),
//     color: Color(0x208F94FB), blurRadius: 5, spreadRadius: 2)];
List<BoxShadow>? searchBoxShadow = Get.isDarkMode
    ? null
    : [
        const BoxShadow(
            offset: Offset(0, 3),
            color: Color(0x208F94FB),
            blurRadius: 5,
            spreadRadius: 2)
      ];

//card boxShadow
List<BoxShadow>? cardShadow = Get.isDarkMode
    ? null
    : [
        BoxShadow(
          offset: const Offset(0, 1),
          blurRadius: 2,
          color: Colors.black.withOpacity(0.15),
        )
      ];

List<BoxShadow>? shadow = Get.isDarkMode
    ? [
        BoxShadow(
            offset: const Offset(0, 3),
            color: Colors.grey[100]!,
            blurRadius: 1,
            spreadRadius: 2)
      ]
    : [
        BoxShadow(
            offset: const Offset(0, 3),
            color: Colors.grey[100]!,
            blurRadius: 1,
            spreadRadius: 2)
      ];

//SUB HEADING
Widget Sub_Heading(context,
    {required String heading, required bool isMandatory}) {
  return Row(
    children: [
      Padding(
        padding: const EdgeInsets.only(left: 2.0),
        child: Text(heading,
            style: ubuntuRegular.copyWith(
                fontSize: Dimensions.fontSizeSmall,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).textTheme.bodyLarge!.color!)),
      ),
      isMandatory == true ? Text("*", style: StarT) : SizedBox.shrink()
    ],
  );
}
