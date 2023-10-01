import 'package:get/get.dart';

import '../controllers/pre_work_checklist_controller.dart';

class PreWorkChecklistBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PreWorkChecklistController>(
      () => PreWorkChecklistController(),
    );
  }
}
