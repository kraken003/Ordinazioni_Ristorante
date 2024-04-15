import 'package:get/get.dart';

import 'maki_controller.dart';

class MakiBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MakiController>(() => MakiController());
  }
}
