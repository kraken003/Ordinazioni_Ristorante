import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class MenuController extends GetxController {
  final RxList<String> categories = <String>[
    'Antipasti', 'Nigiri', 'Maki', 'Temaki', 'Uramaki', 'Gyoza', 'Ramen', 'Dessert', 'Bevande'
  ].obs;

  void onCategorySelected(String categoryName) {
    Get.toNamed('/${categoryName.toLowerCase()}');
  }
}
