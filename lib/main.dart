import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ordinazioni_ristorante_flutter/routes/app_pages.dart';
import 'package:ordinazioni_ristorante_flutter/routes/routes.dart';


import 'package:firebase_core/firebase_core.dart';
import 'features/cart/cart_binding.dart';
import 'firebase_options.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  CartBinding().dependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      getPages: AppPages.routes,
      initialRoute: '/auth'
    );
  }
}