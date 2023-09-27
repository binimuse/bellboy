import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MobileVerificationController extends GetxController {
  late TextEditingController phoneController = TextEditingController();
  final count = 0.obs;
  final phoneFocusNode = FocusNode();
  FocusNode otpFocusNode = FocusNode();
  TextEditingController otpController = TextEditingController();
  List<TextEditingController> otpControllers =
      List.generate(6, (index) => TextEditingController());
  var isPhoneValid = false.obs;
  var isNextPressed = false.obs;
  var isOtpValid = false.obs;
  var isjustForinit = false.obs;
  @override
  void onInit() {
    phoneController = TextEditingController();
    otpController = TextEditingController();
    isjustForinit(true);
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
