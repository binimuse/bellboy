import 'package:bellboy/app/common/widgets/app_toasts.dart';
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
    bool hasShownToast = false;

    while (true) {
      await Future.delayed(const Duration(seconds: 1));

      final notificationPermissionStatus =
          await requestNotificationPermission();
      final locationPermissionStatus = await requestLocationPermission();

      if (notificationPermissionStatus == PermissionStatus.granted &&
          locationPermissionStatus == PermissionStatus.granted) {
        Get.offAllNamed(Routes.PRE_WORK_CHECKLIST);
        break;
      } else {
        if (!hasShownToast) {
          AppToasts.showError("Please Enable Permissions");
          await openAppSettings();
          hasShownToast = true;
        }
      }
    }
  }

  Future<PermissionStatus> requestNotificationPermission() async {
    final status = await Permission.notification.request();
    return status;
  }

  Future<PermissionStatus> requestLocationPermission() async {
    final status = await Permission.location.request();
    return status;
  }
}
