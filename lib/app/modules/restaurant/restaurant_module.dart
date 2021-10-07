import 'package:pscomidas/app/modules/restaurant/restaurant_page.dart';
import 'package:pscomidas/app/modules/restaurant/restaurant_store.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pscomidas/app/modules/restaurant/widgets/product_options/product_store.dart';

class RestaurantModule extends Module {
  static String get routeName => '/restaurant';
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => RestaurantStore()),
    Bind.lazySingleton((i) => ProductOptionsStore(i.get())),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => const RestaurantPage()),
  ];
}
