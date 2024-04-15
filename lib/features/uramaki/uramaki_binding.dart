import 'package:get/get.dart';

import 'uramaki_controller.dart';

class UramakiBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UramakiController>(() => UramakiController());
  }
}
