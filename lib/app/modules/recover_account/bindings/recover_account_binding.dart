import 'package:get/get.dart';

import '../controllers/recover_account_controller.dart';

class RecoverAccountBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RecoverAccountController>(
      () => RecoverAccountController(),
    );
  }
}
