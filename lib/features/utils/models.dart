import 'package:cloud_firestore/cloud_firestore.dart';

class Dish {
  final String id;
  final String name;
  final String description;
  final double price;
  final String imageUrl;
  int quantity;

  Dish({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.imageUrl,
    this.quantity = 1,
  });

  factory Dish.fromFirestore(DocumentSnapshot doc) {
    Map data = doc.data() as Map<String, dynamic>;
    return Dish(
      id: doc.id,
      name: data['name'] ?? '',
      description: data['description'] ?? '',
      price: data['price']?.toDouble() ?? 0.0,
      imageUrl: data['imageUrl'] ?? '',
      quantity: data['quantity'] ?? 1,
    );
  }
}
