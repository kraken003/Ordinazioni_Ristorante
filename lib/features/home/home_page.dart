import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'home_controller.dart';

class HomePage extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: Obx(() => CircleAvatar(
              backgroundImage: controller.profilePicUrl.isNotEmpty ? NetworkImage(controller.profilePicUrl.value) : null,
              backgroundColor: Colors.black,
              child: controller.profilePicUrl.isEmpty ? const Icon(Icons.person, color: Colors.white) : null,
            )),
            onPressed: () {
              showMenu<String>(
                context: context,
                position: const RelativeRect.fromLTRB(100, 100, 0, 0),
                color: Colors.black,
                items: [
                  const PopupMenuItem<String>(
                    value: 'profile',
                    child: Row(
                      children: [
                        Icon(Icons.person, color: Colors.white),
                        SizedBox(width: 8),
                        Text("Profilo", style: TextStyle(color: Colors.white)),
                      ],
                    ),
                  ),
                  const PopupMenuItem<String>(
                    value: 'logout',
                    child: Row(
                      children: [
                        Icon(Icons.exit_to_app, color: Colors.white),
                        SizedBox(width: 8),
                        Text("Logout", style: TextStyle(color: Colors.white)),
                      ],
                    ),
                  ),
                ],
              ).then((value) {
                if (value == 'profile') {
                  controller.goToProfile();
                } else if (value == 'logout') {
                  controller.logout();
                }
              });
            },
          ),

        ],
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Logo del ristorante
            Image(image: AssetImage('images/sushi_harmony_logo.png')),
          ],
        ),
      ),
      bottomNavigationBar: Obx(() => BottomNavigationBar(
        currentIndex: controller.tabIndex.value,
        onTap: controller.changeTabIndex,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.black,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.menu_book),
            label: 'Menù',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Carrello',
          ),
        ],
        backgroundColor: Color(0xFFED6100),
      )),
    );
  }
}
