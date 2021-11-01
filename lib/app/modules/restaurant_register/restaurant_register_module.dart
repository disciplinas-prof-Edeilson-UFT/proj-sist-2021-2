import 'package:flutter_modular/flutter_modular.dart';
import 'package:pscomidas/app/modules/restaurant_register/restaurant_register_page.dart';
import 'package:pscomidas/app/modules/restaurant_register/restaurant_register_store.dart';
import 'package:pscomidas/app/modules/restaurant_register/pages/register_store/register_card.dart';
import 'restaurant_register_page.dart';
import 'restaurant_register_store.dart';

class RestaurantRegisterModule extends Module {
  static String get routeName => '/register/restaurant';

  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => RestaurantRegisterStore()),
  ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/page1',
            child: (context, args) => const RestaurantRegisterPage()),
        ChildRoute(
          '/page2',
          child: (context, args) => const RegisterCard(),
        ),
      ];
}
