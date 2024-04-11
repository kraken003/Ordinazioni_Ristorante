import 'package:get/get.dart';
import 'package:ordinazioni_ristorante_flutter/routes/routes.dart';

import '../features/auth/auth_binding.dart';
import '../features/auth/auth_page.dart';
import '../features/home/home_binding.dart';
import '../features/home/home_page.dart';
import '../features/profiles/profile_binding.dart';
import '../features/profiles/profile_page.dart';

class AppPages{
  static final routes = [
    GetPage(
      name: Routes.AUTH,
      page: () => const AuthPage(),
      binding: AuthBinding()
    ),
    GetPage(
        name: Routes.HOME,
        page: () => HomePage(),
        binding: HomeBinding()
    ),
    GetPage(
        name: Routes.PROFILE,
        page: () => ProfilePage(),
        binding: ProfileBinding()
    ),

    /*
    GetPage(
        name: Routes.CART,
        page: () => const CartPage(),
        binding: CartBinding()
    ),
    GetPage(
        name: Routes.MENU,
        page: () => const MenuPage(),
        binding: MenuBinding()
    ),
    */

  ];
}