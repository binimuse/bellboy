import 'package:get/get.dart';

import '../controllers/find_email_controller.dart';

class FindEmailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FindEmailController>(
      () => FindEmailController(),
    );
  }
}
