import 'package:get/get.dart';

import 'dessert_controller.dart';

class DessertBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DessertController>(() => DessertController());
  }
}
