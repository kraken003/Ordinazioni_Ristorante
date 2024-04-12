import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'menu_controller.dart' as menu;

class MenuPage extends GetView<menu.MenuController> {
  const MenuPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFED6100),
        title: const Text('Menu Categorie'),
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(10),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          childAspectRatio: 1.0,
        ),
        itemCount: controller.categories.length,
        itemBuilder: (context, index) {
          var category = controller.categories[index];
          return Card(
            color: Colors.black,
            clipBehavior: Clip.antiAlias,
            child: InkWell(
              onTap: () => controller.onCategorySelected(category),
              child: Center(
                child: Text(
                  category,
                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.white),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
