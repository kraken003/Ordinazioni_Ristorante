import 'package:get/get.dart';

import 'antipasti_controller.dart';

class AntipastiBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AntipastiController>(() => AntipastiController());
  }
}
