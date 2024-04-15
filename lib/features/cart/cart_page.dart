import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'cart_controller.dart';

class CartPage extends StatelessWidget {
  final CartController cartController = Get.find<CartController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("Carrello"),
        backgroundColor: Color(0xFFED6100),
      ),
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
                    onPressed: () => _showConfirmationDialog(context),
                    child: Text('Ordina', style: TextStyle(color: Colors.white),),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      }),
    );
  }

  void _showConfirmationDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext dialogContext) {
        return AlertDialog(
          title: Text("Conferma"),
          content: Text("Vuoi completare l'ordine?"),
          actions: <Widget>[
            TextButton(
                onPressed: () => Navigator.of(dialogContext).pop(),
                child: Text("NO")
            ),
            TextButton(
                onPressed: () {
                  Navigator.of(dialogContext).pop();
                  _completeOrder(context);
                },
                child: Text("SÌ")
            ),
          ],
        );
      },
    );
  }

  void _completeOrder(BuildContext context) {
    cartController.saveOrder();
    Navigator.of(context).pop();
  }
}
