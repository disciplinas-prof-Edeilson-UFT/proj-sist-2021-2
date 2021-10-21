import 'package:flutter_modular/flutter_modular.dart';
import 'package:pscomidas/app/modules/auth/auth_module.dart';
import 'package:pscomidas/app/modules/cart/cart_module.dart';
import 'package:pscomidas/app/modules/cart/cart_store.dart';
import 'package:pscomidas/app/modules/home/home_module.dart';
import 'package:pscomidas/app/modules/home/store/home_store.dart';
import 'package:pscomidas/app/modules/restaurant/restaurant_module.dart';
import 'modules/auth/auth_module.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => CartStore()),
    Bind.lazySingleton((i) => HomeStore()),
  ];

  @override
  final List<ModularRoute> routes = [
    ModuleRoute(Modular.initialRoute, module: HomeModule()),
    ModuleRoute(RestaurantModule.routeName, module: RestaurantModule()),
    ModuleRoute(CartModule.routeName, module: CartModule()),
    ModuleRoute(AuthModule.routeName, module: AuthModule()),
  ];
}
