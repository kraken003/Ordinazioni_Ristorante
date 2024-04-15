import 'package:get/get.dart';

import 'nigiri_controller.dart';

class NigiriBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NigiriController>(() => NigiriController());
  }
}
