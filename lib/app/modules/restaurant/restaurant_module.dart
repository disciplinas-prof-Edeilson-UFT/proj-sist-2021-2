import 'package:pscomidas/app/modules/restaurant/restaurant_Page.dart';
import 'package:pscomidas/app/modules/restaurant/restaurant_store.dart';
import 'package:flutter_modular/flutter_modular.dart';

class RestaurantModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => RestaurantStore()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => RestaurantPage()),
  ];
}
