import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../utils/order_details_page.dart';
import 'profile_controller.dart';
import 'package:intl/intl.dart';

class ProfilePage extends GetView<ProfileController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFED6100),
        title: Text('Profilo'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              SizedBox(height: 20),
              Obx(() => CircleAvatar(
                radius: 50,
                backgroundColor: Colors.black,
                backgroundImage: controller.profileImageUrl.isNotEmpty
                    ? NetworkImage(controller.profileImageUrl.value)
                    : null,
                child: controller.profileImageUrl.isEmpty
                    ? Icon(Icons.person, size: 50, color: Colors.white,)
                    : null,
              )),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () => controller.updateProfilePicture(),
                child: const Text('Cambia Immagine del Profilo', style: TextStyle(color: Colors.white),),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                ),
              ),
              SizedBox(height: 20),
              Obx(() => Text(controller.userEmail.value)),
              SizedBox(height: 20),
              Text("Storico Ordini", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              Obx(() => ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: controller.orders.length,
                itemBuilder: (context, index) {
                  final order = controller.orders[index];
                  return Column(
                    children: [
                      ListTile(
                        title: Text("Ordine: ${order.id}"),
                        subtitle: Text("Totale: €${order.total.toStringAsFixed(2)}\nData: ${DateFormat('dd/MM/yyyy hh:mm').format(order.orderTime)}"),
                        leading: Icon(Icons.receipt_long, color: Colors.black),
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => OrderDetailsPage(order: order),
                          ));
                        },
                      ),
                      if (index < controller.orders.length - 1) Divider(),
                    ],
                  );
                },
              )),
            ],
          ),
        ),
      ),
    );
  }
}
