import 'package:get/get.dart';
import '../utils/models.dart';

class CartController extends GetxController {
  var cartItems = <Dish>[].obs;

  void addToCart(Dish dish, int quantity) {
    var existingDish = cartItems.firstWhereOrNull((item) => item.id == dish.id);
    if (existingDish != null) {
      existingDish.quantity += quantity;
    } else {
      dish.quantity = quantity;
      cartItems.add(dish);
    }
  }

  void removeFromCart(Dish dish) {
    cartItems.removeWhere((item) => item.id == dish.id);
  }

  double get total => cartItems.fold(0, (sum, item) => sum + item.price * item.quantity);
}
