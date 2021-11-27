import 'package:firebase_auth/firebase_auth.dart';
import 'package:pscomidas/app/modules/restaurant_home/pages/avaliations/avaliations_page.dart';
import 'package:pscomidas/app/modules/restaurant_home/pages/orders/orders_page.dart';
import 'package:pscomidas/app/modules/restaurant_home/pages/plans/restaurant_plan_page.dart';
import 'package:pscomidas/app/modules/restaurant_home/pages/product/product_page.dart';
import 'package:pscomidas/app/modules/restaurant_home/restaurant_home_module.dart';

class ButtonSideBar {
  final FirebaseAuth _auth = FirebaseAuth.instance;
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
    'Planos': {
      'navigator':
          RestaurantHomeModule.routeName + RestaurantPlanPage.routeName,
    },
  };
}
