import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'cart_controller.dart';

class CartPage extends StatelessWidget {
  final CartController cartController = Get.find<CartController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Carrello")),
      body: Obx(() {
        return Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: cartController.cartItems.length,
                itemBuilder: (context, index) {
                  final dish = cartController.cartItems[index];
                  return ListTile(
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(dish.imageUrl),
                    ),
                    title: Text(dish.name),
                    subtitle: Text('Quantità: ${dish.quantity}'),
                    trailing: IconButton(
                      icon: Icon(Icons.remove_circle),
                      onPressed: () => cartController.removeFromCart(dish),
                    ),
                  );
                },
              ),
            ),
            Container(
              padding: EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Totale: ${cartController.total.toStringAsFixed(2)} €', style: TextStyle(fontSize: 20)),
                  ElevatedButton(
                    onPressed: () {
                      //Logica per concludere l'ordine
                    },
                    child: Text('Ordina'),
                  ),
                ],
              ),
            ),
          ],
        );
      }),
    );
  }
}
