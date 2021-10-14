import 'package:pscomidas/app/modules/cart/cart_store.dart';
import 'package:pscomidas/app/modules/restaurant/restaurant_page.dart';
import 'package:pscomidas/app/modules/restaurant/restaurant_service_firestore.dart';
import 'package:pscomidas/app/modules/restaurant/restaurant_store.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pscomidas/app/modules/restaurant/widgets/product_options/product_store.dart';

class RestaurantModule extends Module {
  static String get routeName => '/restaurant';
  @override
  final List<Bind> binds = [
    Bind.singleton((i) => CartStore()),
    Bind.lazySingleton((i) => RestaurantStore(i.get())),
    Bind.lazySingleton((i) => ProductOptionsStore(i.get())),
    Bind.lazySingleton((i) => RestaurantServiceFirestore()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => RestaurantPage(restaurant: args.data)),
  ];
}
