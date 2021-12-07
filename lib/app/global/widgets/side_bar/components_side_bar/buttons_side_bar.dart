import 'package:pscomidas/app/modules/restaurant_home/pages/avaliations/avaliations_page.dart';
import 'package:pscomidas/app/modules/restaurant_home/pages/cupons/cupons_page.dart';
import 'package:pscomidas/app/modules/restaurant_home/pages/orders/orders_page.dart';
import 'package:pscomidas/app/modules/restaurant_home/pages/plans/restaurant_plan_page.dart';
import 'package:pscomidas/app/modules/restaurant_home/pages/product/product_page.dart';
import 'package:pscomidas/app/modules/restaurant_home/restaurant_home_module.dart';

class ButtonSideBar {
  static final buttons = {
    'Produtos': {
      'navigator': RestaurantHomeModule.routeName + ProductPage.routeName,
    },
    'Pedidos': {
      'navigator': RestaurantHomeModule.routeName + OrdersPage.routeName,
    },
    'Avaliações': {
      'navigator': RestaurantHomeModule.routeName + AvaliationsPage.routeName,
    },
    'Cupons': {
      'navigator': RestaurantHomeModule.routeName + CupomPage.routeName,
    },
    'Planos': {
      'navigator':
          RestaurantHomeModule.routeName + RestaurantPlanPage.routeName,
    },
  };
}
