import 'package:flutter_modular/flutter_modular.dart';
import 'package:pscomidas/app/modules/register/restaurant/register_page.dart';
import 'package:pscomidas/app/modules/register/restaurant/store/models/register_store.dart';
// import 'register_page.dart';
// import 'register_store.dart';

class RestaurantRegisterModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => RegisterStore()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => const RestaurantRegisterPage()),
  ];
}
