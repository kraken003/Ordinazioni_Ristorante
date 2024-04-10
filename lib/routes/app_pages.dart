import 'package:get/get.dart';
import 'package:ordinazioni_ristorante_flutter/routes/routes.dart';

import '../features/auth/auth_binding.dart';
import '../features/auth/auth_page.dart';

class AppPages{
  static final routes = [
    GetPage(
      name: Routes.AUTH,
      page: () => const AuthPage(),
      binding: AuthBinding()
    ),

    /*
    GetPage(
        name: Routes.HOME,
        page: () => const HomePage(),
        binding: HomeBinding()
    ),
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
    GetPage(
        name: Routes.PROFILE,
        page: () => const ProfilePage(),
        binding: ProfileBinding()
    ),
    */

  ];
}