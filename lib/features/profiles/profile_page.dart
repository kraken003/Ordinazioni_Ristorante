import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'profile_controller.dart';

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
              // Bisogna inserire lo storico degli ordini
            ],
          ),
        ),
      ),
    );
  }
}

