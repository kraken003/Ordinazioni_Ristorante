import 'package:get/get.dart';

import 'gyoza_controller.dart';

class GyozaBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<GyozaController>(() => GyozaController());
  }
}
