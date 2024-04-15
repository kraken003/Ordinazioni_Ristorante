import 'package:get/get.dart';

import 'bevande_controller.dart';

class BevandeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BevandeController>(() => BevandeController());
  }
}
