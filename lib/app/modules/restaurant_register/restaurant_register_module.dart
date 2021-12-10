import 'package:flutter_modular/flutter_modular.dart';
import 'package:pscomidas/app/global/repositories/register/register_repository.dart';
import 'package:pscomidas/app/modules/restaurant_register/restaurant_register_page.dart';
import 'package:pscomidas/app/modules/restaurant_register/pages/register_shop/shop_register_card.dart';
import 'package:pscomidas/app/modules/restaurant_register/restaurant_register_store.dart';
import 'restaurant_register_page.dart';

class RestaurantRegisterModule extends Module {
  static String get routeName => '/register/restaurant/';
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => RegisterRepository()),
    Bind.lazySingleton((i) => RestaurantRegisterStore()),
  ];
  @override
  List<ModularRoute> get routes => [
        ChildRoute(RestaurantRegisterPage.routeName,
            child: (context, args) => const RestaurantRegisterPage()),
        ChildRoute(
          ShopRegisterCard.routeName,
          child: (context, args) => const ShopRegisterCard(),
        ),
      ];
}
