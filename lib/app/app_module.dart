import 'package:flutter_modular/flutter_modular.dart';
import 'package:pscomidas/app/modules/restaurant/restaurant_module.dart';

import 'modules/home/home_module.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [];

  @override
  final List<ModularRoute> routes = [
    ModuleRoute(Modular.initialRoute, module: HomeModule()),
    ModuleRoute(RestaurantModule.routeName, module: RestaurantModule()),
  ];
}
