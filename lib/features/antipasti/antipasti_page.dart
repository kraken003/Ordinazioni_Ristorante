import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'antipasti_controller.dart';
import '../utils/models.dart';

class AntipastiPage extends GetView<AntipastiController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Antipasti")),
      body: Obx(() {
        return GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: 0.55,
          ),
          itemCount: controller.dishes.length,
          itemBuilder: (context, index) {
            final dish = controller.dishes[index];
            return Card(
              clipBehavior: Clip.antiAlias,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: 150,
                    width: double.infinity,
                    child: Image.network(dish.imageUrl, fit: BoxFit.cover),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(dish.name, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text(dish.description, overflow: TextOverflow.ellipsis, maxLines: 2, style: TextStyle(fontSize: 15)),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('${dish.price.toStringAsFixed(2)} €', style: TextStyle(fontSize: 15)),
                  ),
                  QuantityControl(
                      dish: dish,
                      onSelected: (quantity) {
                        controller.updateQuantity(dish, quantity);
                      }
                  ),
                  ElevatedButton(
                    onPressed: () => controller.addToCart(dish),
                    child: Text('Aggiungi al carrello'),
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Theme.of(context).colorScheme.secondary,
                    ),
                  ),
                ],
              ),
            );
          },
        );
      }),
    );
  }
}

class QuantityControl extends StatefulWidget {
  final Dish dish;
  final Function(int) onSelected;

  const QuantityControl({Key? key, required this.dish, required this.onSelected}) : super(key: key);

  @override
  _QuantityControlState createState() => _QuantityControlState();
}

class _QuantityControlState extends State<QuantityControl> {
  int quantity = 1;

  void increment() {
    setState(() {
      quantity++;
      widget.onSelected(quantity);
    });
  }

  void decrement() {
    if (quantity > 1) {
      setState(() {
        quantity--;
        widget.onSelected(quantity);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          icon: Icon(Icons.remove),
          onPressed: decrement,
          iconSize: 15,
        ),
        Text("$quantity", style: TextStyle(fontSize: 15)),
        IconButton(
          icon: Icon(Icons.add),
          onPressed: increment,
          iconSize: 15,
        ),
      ],
    );
  }
}
