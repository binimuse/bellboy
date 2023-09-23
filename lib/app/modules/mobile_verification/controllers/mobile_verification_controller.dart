import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MobileVerificationController extends GetxController {
  late TextEditingController phoneController = TextEditingController();
  final count = 0.obs;

  var isPhoneValid = false.obs;
  @override
  void onInit() {
    phoneController = TextEditingController();
    super.onInit();
  }

  bool validatPhone() {
    final password = phoneController.text;
    if (password.length >= 8) {
      isPhoneValid(true);
      return true;
    } else {
      isPhoneValid(false);
      return false;
    }
  }

  void increment() => count.value++;
}
