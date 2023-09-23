import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FindPasswordController extends GetxController {
  late TextEditingController emailController = TextEditingController();

  final count = 0.obs;
  @override
  void onInit() {
    emailController = TextEditingController();

    super.onInit();
  }

  var isEmailValidated = false.obs;
  bool validateEmail() {
    final email = emailController.text;
    if (email.isNotEmpty && email.contains('@') && email.contains('.')) {
      isEmailValidated.value = true;
      return true;
    } else {
      isEmailValidated.value = false;
      return false;
    }
  }
}
