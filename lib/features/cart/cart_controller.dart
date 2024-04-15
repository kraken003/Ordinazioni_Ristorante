import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../utils/models.dart';

class CartController extends GetxController {
  var cartItems = <Dish>[].obs;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  String get userId => _auth.currentUser?.uid ?? "";

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

  void clearCart() {
    cartItems.clear();
    update();
  }

  double get total => cartItems.fold(0, (sum, item) => sum + item.price * item.quantity);

  void saveOrder() {
    if (userId.isEmpty) {
      Get.snackbar("Errore", "Utente non autenticato");
      return;
    }

    var order = {
      'userId': userId,
      'items': cartItems.map((item) => {
        'name': item.name,
        'quantity': item.quantity,
        'price': item.price,
      }).toList(),
      'total': total,
      'orderTime': Timestamp.now(),
    };

    FirebaseFirestore.instance.collection('orders').add(order).then((result) {
      clearCart();
      Get.snackbar("Successo", "Ordine completato con successo!");
    }).catchError((error) {
      Get.snackbar("Errore", "Errore durante il salvataggio dell'ordine: $error");
    });
  }
}
