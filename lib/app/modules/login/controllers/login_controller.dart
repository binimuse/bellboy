import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  late TextEditingController emailController = TextEditingController();
  late TextEditingController passwordController = TextEditingController();

  late FocusNode passwordFocusNode = FocusNode();

  var isEmailValidated = false.obs;
  var isNextPressed = false.obs;
  var isPasswordValid = false.obs;
  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();

    emailController = TextEditingController();
    passwordController = TextEditingController();

    passwordFocusNode = FocusNode();
  }

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

  bool validatePassword() {
    final password = passwordController.text;
    if (password.isNotEmpty) {
      isPasswordValid.value = true;
      return true;
    } else {
      isPasswordValid.value = false;
      return false;
    }
  }

  void increment() => count.value++;
}
