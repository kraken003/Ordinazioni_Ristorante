import 'package:get/get.dart';
import 'package:ordinazioni_ristorante_flutter/routes/routes.dart';

import '../features/antipasti/antipasti_binding.dart';
import '../features/antipasti/antipasti_page.dart';
import '../features/auth/auth_binding.dart';
import '../features/auth/auth_page.dart';
import '../features/home/home_binding.dart';
import '../features/home/home_page.dart';
import '../features/menu/menu_binding.dart';
import '../features/menu/menu_page.dart';
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
    GetPage(
        name: Routes.MENU,
        page: () => const MenuPage(),
        binding: MenuBinding()
    ),
    GetPage(
        name: Routes.ANTIPASTI,
        page: () => AntipastiPage(),
        binding: AntipastiBinding()
    ),

    /*
    GetPage(
        name: Routes.CART,
        page: () => const CartPage(),
        binding: CartBinding()
    ),

    GetPage(
        name: Routes.NIGIRI,
        page: () => const NigiriPage(),
        binding: NigiriBinding()
    ),
    GetPage(
        name: Routes.MAKI,
        page: () => const MakiPage(),
        binding: MakiBinding()
    ),
    GetPage(
        name: Routes.TEMAKI,
        page: () => const TemakiPage(),
        binding: TemakiBinding()
    ),
    GetPage(
        name: Routes.URAMAKI,
        page: () => const UramakiPage(),
        binding: UramakiBinding()
    ),
    GetPage(
        name: Routes.GYOZA,
        page: () => const GyozaPage(),
        binding: GyozaBinding()
    ),
    GetPage(
        name: Routes.RAMEN,
        page: () => const RamenPage(),
        binding: RamenBinding()
    ),
    GetPage(
        name: Routes.DESSERT,
        page: () => const DessertPage(),
        binding: DessertBinding()
    ),
    GetPage(
        name: Routes.BEVANDE,
        page: () => const BevandePage(),
        binding: BevandeBinding()
    ),
    */

  ];
}