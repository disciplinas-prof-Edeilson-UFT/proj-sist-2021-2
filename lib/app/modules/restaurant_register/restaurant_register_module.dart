import 'package:flutter_modular/flutter_modular.dart';
import 'package:pscomidas/app/modules/restaurant_register/restaurant_register_page.dart';
import 'package:pscomidas/app/modules/restaurant_register/pages/register_shop/shop_register_card.dart';
import 'restaurant_register_page.dart';

class RestaurantRegisterModule extends Module {
  static String get routeName => '/register/restaurant/';

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
