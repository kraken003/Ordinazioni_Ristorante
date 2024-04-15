import 'package:get/get.dart';

import 'temaki_controller.dart';

class TemakiBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TemakiController>(() => TemakiController());
  }
}
