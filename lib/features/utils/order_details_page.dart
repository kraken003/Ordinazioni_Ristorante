import 'package:flutter/material.dart';
import 'order.dart';

class OrderDetailsPage extends StatelessWidget {
  final RestaurantOrder order;

  const OrderDetailsPage({Key? key, required this.order}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dettagli Ordine'),
        backgroundColor: Color(0xFFED6100),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text('ID Ordine: ${order.id}', style: TextStyle(fontWeight: FontWeight.bold)),
            Text('Totale: €${order.total.toStringAsFixed(2)}'),
            Text('Data Ordine: ${order.orderTime.toString()}'),
            Divider(),
            Text('Articoli:', style: TextStyle(fontWeight: FontWeight.bold)),
            Expanded(
              child: ListView.builder(
                itemCount: order.items.length,
                itemBuilder: (context, index) {
                  final item = order.items[index];
                  return ListTile(
                    title: Text(item.name),
                    subtitle: Text('Quantità: ${item.quantity}'),
                    trailing: Text('€${(item.price * item.quantity).toStringAsFixed(2)}'),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
