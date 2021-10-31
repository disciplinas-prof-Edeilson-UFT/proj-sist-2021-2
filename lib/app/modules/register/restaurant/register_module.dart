import 'package:flutter_modular/flutter_modular.dart';
import 'package:pscomidas/app/modules/register/restaurant/register_page.dart';
import 'package:pscomidas/app/modules/register/restaurant/register_store.dart';
import 'package:pscomidas/app/modules/register/restaurant/components/page_two/register_card.dart';
import 'register_page.dart';
import 'register_store.dart';

class RestaurantRegisterModule extends Module {
  static String get routeName => 'register/restaurant';

  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => RegisterStore()),
  ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/page1',
            child: (context, args) => RestaurantRegisterPage()),
        ChildRoute(
          '/page2',
          child: (context, args) => RegisterRestaurant(),
        ),
      ];
}
