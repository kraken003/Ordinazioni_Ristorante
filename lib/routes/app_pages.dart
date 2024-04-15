import 'package:get/get.dart';
import 'package:ordinazioni_ristorante_flutter/routes/routes.dart';


import '../features/antipasti/antipasti_binding.dart';
import '../features/antipasti/antipasti_page.dart';
import '../features/auth/auth_binding.dart';
import '../features/auth/auth_page.dart';
import '../features/bevande/bevande_binding.dart';
import '../features/bevande/bevande_page.dart';
import '../features/cart/cart_binding.dart';
import '../features/cart/cart_page.dart';
import '../features/dessert/dessert_binding.dart';
import '../features/dessert/dessert_page.dart';
import '../features/gyoza/gyoza_binding.dart';
import '../features/gyoza/gyoza_page.dart';
import '../features/home/home_binding.dart';
import '../features/home/home_page.dart';
import '../features/maki/maki_binding.dart';
import '../features/maki/maki_page.dart';
import '../features/menu/menu_binding.dart';
import '../features/menu/menu_page.dart';
import '../features/nigiri/nigiri_binding.dart';
import '../features/nigiri/nigiri_page.dart';
import '../features/profiles/profile_binding.dart';
import '../features/profiles/profile_page.dart';
import '../features/ramen/ramen_binding.dart';
import '../features/ramen/ramen_page.dart';
import '../features/temaki/temaki_binding.dart';
import '../features/temaki/temaki_page.dart';
import '../features/uramaki/uramaki_binding.dart';
import '../features/uramaki/uramaki_page.dart';

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

    GetPage(
        name: Routes.CART,
        page: () => CartPage(),
        binding: CartBinding()
    ),

    GetPage(
        name: Routes.NIGIRI,
        page: () => NigiriPage(),
        binding: NigiriBinding()
    ),
    GetPage(
        name: Routes.MAKI,
        page: () => MakiPage(),
        binding: MakiBinding()
    ),
    GetPage(
        name: Routes.TEMAKI,
        page: () => TemakiPage(),
        binding: TemakiBinding()
    ),
    GetPage(
        name: Routes.URAMAKI,
        page: () => UramakiPage(),
        binding: UramakiBinding()
    ),
    GetPage(
        name: Routes.GYOZA,
        page: () => GyozaPage(),
        binding: GyozaBinding()
    ),
    GetPage(
        name: Routes.RAMEN,
        page: () => RamenPage(),
        binding: RamenBinding()
    ),
    GetPage(
        name: Routes.DESSERT,
        page: () => DessertPage(),
        binding: DessertBinding()
    ),
    GetPage(
        name: Routes.BEVANDE,
        page: () => BevandePage(),
        binding: BevandeBinding()
    ),
  ];
}