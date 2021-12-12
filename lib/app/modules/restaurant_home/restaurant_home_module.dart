import 'package:pscomidas/app/global/utils/auth_guard.dart';
import 'package:pscomidas/app/global/widgets/not_found/not_found_page.dart';
import 'package:pscomidas/app/modules/restaurant_home/pages/avaliations/avaliations_page.dart';
import 'package:pscomidas/app/modules/restaurant_home/pages/orders/orders_page.dart';
import 'package:pscomidas/app/modules/restaurant_home/pages/plans/restaurant_plan_page.dart';
import 'package:pscomidas/app/modules/restaurant_home/pages/product/product_page.dart';
import 'package:pscomidas/app/modules/restaurant_home/restaurant_home_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class RestaurantHomeModule extends Module {
  static String get routeName => '/restaurant_home';

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/',
            child: (context, args) => const RestaurantHomePage(),
            guards: [
              ClientGuard()
            ],
            children: [
              ChildRoute(ProductPage.routeName,
                  child: (context, args) => const ProductPage()),
              ChildRoute(OrdersPage.routeName,
                  child: (context, args) => const OrdersPage()),
              ChildRoute(AvaliationsPage.routeName,
                  child: (context, args) => const AvaliationsPage()),
              ChildRoute(RestaurantPlanPage.routeName,
                  child: (context, args) => const RestaurantPlanPage()),
              ChildRoute('/',
                  child: (context, args) => const RestaurantHomePage()),
            ]),
        WildcardRoute(child: (context, args) => const NotFoundPage()),
      ];
}
