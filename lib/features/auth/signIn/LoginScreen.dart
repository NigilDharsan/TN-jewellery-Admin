import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tn_jewellery_admin/Utils/core/helper/route_helper.dart';
import 'package:tn_jewellery_admin/features/auth/controller/auth_controller.dart';
import 'package:tn_jewellery_admin/features/landing/landing_screen.dart';
import 'package:tn_jewellery_admin/utils/colors.dart';
import 'package:tn_jewellery_admin/utils/images.dart';
import 'package:get/get_core/src/get_main.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Center(
          child: GetBuilder<AuthController>(builder: (controller) {
            return SingleChildScrollView(
              child: Form(
                key: controller.formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(Images.logolpeg, height: 100),
                    const SizedBox(height: 20),
                    const Text(
                      'SIGN IN',
                      style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: brandGreyColor),
                    ),
                    const SizedBox(height: 30),
                    _buildTextField(
                        'Enter your text here',
                        'LOGIN/USER NAME/EMAIL',
                        controller.signInEmailController,
                        false,
                        controller),
                    const SizedBox(height: 20),
                    _buildTextField('Enter your text here', 'PASSWORD',
                        controller.signInPasswordController, true, controller),
                    SizedBox(height: 5),
                    const SizedBox(height: 30),
                    _buildSignInButton(controller),
                    const SizedBox(height: 30),
                  ],
                ),
              ),
            );
          }),
        ),
      ),
    );
  }

  Widget _buildTextField(
      String hintName,
      String label,
      TextEditingController textController,
      bool isPassword,
      AuthController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
              fontSize: 14, fontWeight: FontWeight.bold, color: brandGreyColor),
        ),
        const SizedBox(height: 5),
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 5,
                offset: Offset(0, 1),
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.all(2.0),
            child: TextFormField(
              controller: textController,
              obscureText: isPassword ? controller.obscurePassword : false,
              decoration: InputDecoration(
                hintText: hintName,
                hintStyle: const TextStyle(color: brandGreySoftColor),
                filled: true,
                fillColor: brandGoldLightColor,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide.none,
                ),
                suffixIcon: isPassword
                    ? IconButton(
                        icon: Icon(
                          controller.obscurePassword
                              ? Icons.visibility_off
                              : Icons.visibility,
                          color: Colors.black,
                        ),
                        onPressed: () {
                          if (controller.obscurePassword) {
                            controller.obscurePassword = false;
                          } else {
                            controller.obscurePassword = true;
                          }
                          controller.update();
                        },
                      )
                    : null,
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return isPassword ? 'Enter Password' : 'Enter Email/Username';
                }
                return null;
              },
            ),
          ),
        ),
        const SizedBox(height: 5),
      ],
    );
  }

  Widget _buildSignInButton(AuthController controller) {
    return Container(
      width: 235,
      height: 50,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 10,
            offset: Offset(0, 5),
          ),
        ],
      ),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF8D3D5B),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        onPressed: () {
          if (controller.formKey.currentState!.validate()) {
            // controller.login();
            Navigator.push(context, MaterialPageRoute(builder: (context)=>MainScreen(pageIndex: 0)));
          }
        },
        child: const Text(
          'SIGN IN',
          style: TextStyle(
              fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
    );
  }
}
