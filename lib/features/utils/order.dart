import 'package:cloud_firestore/cloud_firestore.dart';

class RestaurantOrder {
  String id;
  DateTime orderTime;
  double total;
  List<OrderItem> items;

  RestaurantOrder({this.id = '', required this.orderTime, required this.total, required this.items});

  factory RestaurantOrder.fromFirestore(DocumentSnapshot doc) {
    Map data = doc.data() as Map<String, dynamic>;
    return RestaurantOrder(
      id: doc.id,
      orderTime: (data['orderTime'] as Timestamp).toDate(),
      total: data['total'].toDouble(),
      items: (data['items'] as List).map((i) => OrderItem.fromMap(i)).toList(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'orderTime': Timestamp.fromDate(orderTime),
      'total': total,
      'items': items.map((item) => item.toMap()).toList(),
    };
  }
}

class OrderItem {
  String name;
  int quantity;
  double price;

  OrderItem({required this.name, required this.quantity, required this.price});

  factory OrderItem.fromMap(Map<String, dynamic> map) {
    return OrderItem(
      name: map['name'],
      quantity: map['quantity'],
      price: (map['price'] as num).toDouble(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'quantity': quantity,
      'price': price,
    };
  }
}
