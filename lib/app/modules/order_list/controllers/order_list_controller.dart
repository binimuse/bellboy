// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrderListController extends GetxController
    with SingleGetTickerProviderMixin {
  final GlobalKey<ScaffoldState> keyforall = GlobalKey<ScaffoldState>();
  final GlobalKey<ScaffoldState> keyforallmap = GlobalKey<ScaffoldState>();
  late TabController tabController;

  var isMapView = false.obs;
  var isZoomLevel200 = false.obs;
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
