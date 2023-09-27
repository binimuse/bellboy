import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FindPasswordController extends GetxController {
  late TextEditingController emailController = TextEditingController();
  final passwordFocusNode = FocusNode();
  final count = 0.obs;
  @override
  void onInit() {
    emailController = TextEditingController();

    super.onInit();
  }

  var isEmailValidated = false.obs;
  bool validateEmail() {
    final email = emailController.text.trim();

    // Regular expression pattern for email validation
    final emailRegex = RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$');

    if (email.isNotEmpty && emailRegex.hasMatch(email)) {
      isEmailValidated.value = true;
      return true;
    } else {
      isEmailValidated.value = false;
      return false;
    }
  }
}
