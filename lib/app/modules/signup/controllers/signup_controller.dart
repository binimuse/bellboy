import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignupController extends GetxController {
  RxBool allTermsChecked = false.obs;

  final List<ValueNotifier<bool>> termCheckboxes = [
    ValueNotifier<bool>(false),
    ValueNotifier<bool>(false),
  ];

  void markAllTerms() {
    for (var termCheckbox in termCheckboxes) {
      termCheckbox.value = true;
    }
    allTermsChecked.value = true;
  }

  void markTerm(int index) {
    termCheckboxes[index].value = true;
    allTermsChecked.value =
        termCheckboxes.every((checkbox) => checkbox.value == true);
  }
}
