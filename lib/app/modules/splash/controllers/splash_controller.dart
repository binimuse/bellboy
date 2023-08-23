import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../../config/theme/app_assets.dart';
import '../../../routes/app_pages.dart';

class SplashController extends GetxController {
  final String splasehimage = AppAssets.splasehimage;

  @override
  void onInit() {
    waitAndNavigate();

    super.onInit();
  }

  waitAndNavigate() async {
    Future.delayed(const Duration(seconds: 2), () async {
      await requestNotificationPermission();
      await requestLocationPermission();

      Get.offAllNamed(Routes.ON_BORDING);
    });
  }

  Future<void> requestNotificationPermission() async {
    final status = await Permission.notification.request();
    if (status.isDenied) {}
  }

  Future<void> requestLocationPermission() async {
    final status = await Permission.location.request();
    if (status.isDenied) {
      // Handle denied permission
    }
  }
}