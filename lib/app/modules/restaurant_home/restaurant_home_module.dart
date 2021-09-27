import 'package:pscomidas/app/modules/restaurant_home/restaurant_home_page.dart';
import 'package:pscomidas/app/modules/restaurant_home/restaurant_home_store.dart';
import 'package:flutter_modular/flutter_modular.dart';

class RestaurantHomeModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => RestaurantHomeStore()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => const RestaurantHomePage()),
  ];
}
