import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tn_jewellery_admin/utils/colors.dart';
import 'package:tn_jewellery_admin/utils/dimensions.dart' show Dimensions;
import 'package:tn_jewellery_admin/utils/styles.dart';

class CustomTextField extends StatefulWidget {
  final String? hintText;
  final String? title;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final FocusNode? nextFocus;
  final TextInputType? inputType;
  final TextInputAction? inputAction;
  final bool? isPassword;
  final bool? isVerify;
  final bool? isShowBorder;
  final bool? isAutoFocus;
  final Function(String)? onSubmit;
  final bool? isEnabled;
  final int? maxLines;
  final bool? isShowSuffixIcon;
  final TextCapitalization? capitalization;
  final Function(String text)? onChanged;
  final String? countryDialCode;
  final String? suffixIconUrl;
  final Widget? prefixIcon;
  final double? borderRadius;
  final Color? fillColor;
  final String? Function(String?)? onValidate;
  final bool? isVerifyEmail;
  final bool? isVerifyPhone;

  const CustomTextField({
    super.key,
    this.hintText = '',
    this.controller,
    this.focusNode,
    this.nextFocus,
    this.isEnabled = true,
    this.inputType = TextInputType.text,
    this.inputAction = TextInputAction.next,
    this.maxLines = 1,
    this.isShowSuffixIcon = false,
    this.onSubmit,
    this.capitalization = TextCapitalization.none,
    this.isPassword = false,
    this.isShowBorder = false,
    this.isAutoFocus = false,
    this.countryDialCode,
    this.suffixIconUrl,
    this.onChanged,
    this.onValidate,
    this.prefixIcon,
    this.borderRadius = Dimensions.radiusSmall,
    this.fillColor,
    this.title,
    this.isVerify = false,
    this.isVerifyEmail = false,
    this.isVerifyPhone = false,
  });

  @override
  CustomTextFieldState createState() => CustomTextFieldState();
}

class CustomTextFieldState extends State<CustomTextField> {
  bool _obscureText = true;
  _hideKeyboard() => FocusManager.instance.primaryFocus?.unfocus();

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: widget.maxLines,
      controller: widget.controller,
      focusNode: widget.focusNode,
      style: JosefinRegular.copyWith(
          fontSize: Dimensions.fontSizeDefault,
          color: widget.isEnabled == false
              ? Theme.of(context).textTheme.bodyLarge!.color!.withOpacity(0.6)
              : Theme.of(context).textTheme.bodyLarge!.color),
      textInputAction: widget.inputAction,
      keyboardType: widget.inputType,
      cursorColor: Theme.of(context).hintColor,
      textCapitalization: widget.capitalization!,
      enabled: widget.isEnabled,
      autofocus: widget.isAutoFocus!,
      autofillHints: widget.inputType == TextInputType.name
          ? [AutofillHints.name]
          : widget.inputType == TextInputType.emailAddress
              ? [AutofillHints.email]
              : widget.inputType == TextInputType.phone
                  ? [AutofillHints.telephoneNumber]
                  : widget.inputType == TextInputType.streetAddress
                      ? [AutofillHints.fullStreetAddress]
                      : widget.inputType == TextInputType.url
                          ? [AutofillHints.url]
                          : widget.inputType == TextInputType.visiblePassword
                              ? [AutofillHints.password]
                              : null,
      obscureText: widget.isPassword! ? _obscureText : false,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(widget.borderRadius!),
          borderSide: const BorderSide(style: BorderStyle.none, width: 0),
        ),
        isDense: true,
        filled: true,
        fillColor: widget.fillColor ?? Theme.of(context).cardColor,
        contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
        hintText: widget.hintText,
        hintStyle: JosefinRegular.copyWith(
            fontSize: Dimensions.fontSizeDefault,
            color: buttonColor.withOpacity(0.5)
            //Theme.of(context).hintColor.withOpacity(Get.isDarkMode ? .5 : 1),
            ),
        prefixIcon: widget.prefixIcon,
        suffixIcon: widget.isPassword!
            ? IconButton(
                splashRadius: 20,
                icon: Icon(
                    _obscureText ? Icons.visibility_off : Icons.visibility,
                    color: buttonColor),
                onPressed: _toggle,
              )
            : widget.isVerify!
                ? GestureDetector(
                    onTap: _verify,
                    child: Container(
                      width: 50,
                      height: 20,
                      margin: EdgeInsets.only(right: 5.0),
                      alignment: Alignment.centerRight,
                      child: Text(
                        'Verify'.tr,
                        textAlign: TextAlign.end,
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: buttonTextColor,
                        ),
                      ),
                    ),
                  )
                : null,
      ),
      onFieldSubmitted: (text) => widget.nextFocus != null
          ? FocusScope.of(context).requestFocus(widget.nextFocus)
          : widget.onSubmit != null
              ? widget.onSubmit!(text)
              : null,
      onChanged: widget.onChanged,
      validator: widget.onValidate != null ? widget.onValidate! : null,
    );
  }

  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  void _verify() {
    _hideKeyboard();
    if (widget.isVerifyEmail ?? false) {
      // Get.toNamed(RouteHelper.emailVerificationScreen);
    } else if (widget.isVerifyPhone ?? false) {
      // Get.toNamed(RouteHelper.verificationScreen);
    }
  }
}

//TEXTFIELD DATE PICKER
Widget TextFieldDatePicker(
    {TextEditingController? Controller,
    String? Function(String?)? validating,
    void Function(String)? onChanged,
    required String hintText,
    required bool isDownArrow,
    FocusNode? focusNode,
    void Function()? onTap}) {
  return TextFormField(
    controller: Controller,
    autovalidateMode: AutovalidateMode.onUserInteraction,
    onTap: onTap,
    readOnly: true,
    focusNode: focusNode,
    keyboardType: TextInputType.number,
    maxLength: 15,
    decoration: InputDecoration(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(color: Colors.white),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(color: Colors.white),
      ),
      counterText: "",
      hintText: hintText,
      helperStyle: TextStyle(
          fontFamily: 'Roboto',
          fontSize: 12,
          color: Color.fromRGBO(140, 140, 140, 1),
          fontWeight: FontWeight.w400),
      suffixIcon: Icon(
        Icons.calendar_today_outlined,
        color: Colors.black,
        size: 25,
      ),
      hintStyle: TextStyle(
          fontFamily: 'Roboto',
          fontSize: 12,
          color: Color.fromRGBO(140, 140, 140, 1),
          fontWeight: FontWeight.w400),
      errorMaxLines: 3,
      contentPadding:
          const EdgeInsets.only(top: 8.0, bottom: 8.0, left: 8, right: 2.0),
      fillColor: Colors.white,
      filled: true,
    ),
    validator: validating,
    onChanged: onChanged,
    textInputAction: TextInputAction.next,
    style: const TextStyle(
      fontFamily: 'JosefinSans',
      color: brandGoldColor,
      fontWeight: FontWeight.w700,
      fontSize: 18,
    ),
  );
}
