import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// Controller for the on-boarding screen.
class OnBordingController extends GetxController {
  final RxBool isLightTheme = false.obs;

  var isApiLoading = false.obs;
  var hasNetworkError = false.obs;
  var isoptional = true.obs;
  var appversion = "".obs;
  var currentSlide = 0.obs;

  /// List of titles for the on-boarding slides.
  List<String> titles = [
    'The business of my becoming the Boss',
    'Revenue generation every week'
  ]; // Add or change this based on your requirement

  @override
  void onInit() {
    pageController = PageController();
    super.onInit();
  }

  late PageController pageController;
  int currentIndex = 0;

  /// Function called when the current slide is changed.
  onChangedFunction(int index) {
    currentIndex = index;
  }
}
