import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../utils/models.dart';

class AntipastiController extends GetxController {
  final RxList<Dish> dishes = <Dish>[].obs;
  final RxList<Dish> cart = <Dish>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchDishes();
  }

  void fetchDishes() async {
    FirebaseFirestore.instance
        .collection('dishes')
        .where('category', isEqualTo: 'Antipasti')
        .get()
        .then((snapshot) {
      dishes.value = snapshot.docs.map((doc) => Dish.fromFirestore(doc)).toList();
    });
  }

  void addToCart(Dish dish) {
    cart.add(dish);
    Get.snackbar('Aggiunto al carrello', 'Hai aggiunto ${dish.name} al carrello!');
  }
}
