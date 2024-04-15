import 'package:get/get.dart';

import 'ramen_controller.dart';

class RamenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RamenController>(() => RamenController());
  }
}
