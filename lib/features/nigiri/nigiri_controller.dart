import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import '../cart/cart_controller.dart';
import '../utils/models.dart';

class NigiriController extends GetxController {
  final RxList<Dish> dishes = <Dish>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchDishes();
  }

  void fetchDishes() async {
    FirebaseFirestore.instance
        .collection('dishes')
        .where('category', isEqualTo: 'Nigiri')
        .get()
        .then((snapshot) {
      dishes.value = snapshot.docs.map((doc) => Dish.fromFirestore(doc)).toList();
    });
  }

  void addToCart(Dish dish) {
    final cartController = Get.find<CartController>();
    cartController.addToCart(dish, dish.quantity);
    Get.snackbar('Aggiunto al carrello', 'Hai aggiunto ${dish.name} al carrello!');
  }

  void updateQuantity(Dish dish, int quantity) {
    var foundDish = dishes.firstWhereOrNull((d) => d.id == dish.id);
    if (foundDish != null) {
      foundDish.quantity = quantity;
    }
  }
}
