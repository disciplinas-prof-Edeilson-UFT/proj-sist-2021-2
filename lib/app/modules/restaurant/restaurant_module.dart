import 'package:pscomidas/app/modules/restaurant/restaurant_page.dart';
import 'package:pscomidas/app/modules/restaurant/restaurant_store.dart';
import 'package:flutter_modular/flutter_modular.dart';

class RestaurantModule extends Module {
  static String get routeName => '/restaurant';
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => RestaurantStore()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => const RestaurantPage()),
  ];
}
