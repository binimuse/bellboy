// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrderListController extends GetxController
    with SingleGetTickerProviderMixin {
  final GlobalKey<ScaffoldState> keyforall = GlobalKey<ScaffoldState>();
  late TabController tabController;
  @override
  void onInit() {
    super.onInit();
    tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }
}
