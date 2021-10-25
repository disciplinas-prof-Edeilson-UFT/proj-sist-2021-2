import 'package:pscomidas/app/modules/restaurant_home/components/product_page.dart';
import 'package:pscomidas/app/modules/restaurant_home/restaurant_home_page.dart';
import 'package:pscomidas/app/modules/restaurant_home/restaurant_home_store.dart';
import 'package:flutter_modular/flutter_modular.dart';

class RestaurantHomeModule extends Module {
  static String get routeName => '/restaurant_home';
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => RestaurantHomeStore()),
  ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (context, args) => const RestaurantHomePage()),
        ChildRoute('/products', child: (context, args) => const ProductPage()),
      ];
}
