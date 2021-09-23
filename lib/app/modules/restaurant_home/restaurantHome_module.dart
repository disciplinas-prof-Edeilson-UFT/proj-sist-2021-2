import 'package:pscomidas/app/modules/restaurant_home/restaurantHome_Page.dart';
import 'package:pscomidas/app/modules/restaurant_home/restaurantHome_store.dart';
import 'package:flutter_modular/flutter_modular.dart';

class RestaurantHomeModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => RestaurantHomeStore()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => RestaurantHomePage()),
  ];
}
