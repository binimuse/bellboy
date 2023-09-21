import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgotpasswordController extends GetxController {
  late TextEditingController emailController = TextEditingController();

  final count = 0.obs;
  @override
  void onInit() {
    emailController = TextEditingController();

    super.onInit();
  }



  void increment() => count.value++;
}
