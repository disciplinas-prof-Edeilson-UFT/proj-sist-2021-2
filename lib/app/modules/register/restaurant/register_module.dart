import 'package:flutter_modular/flutter_modular.dart';
import 'register_page.dart';
import 'register_store.dart';

class RestaurantRegisterModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => RestaurantRegisterStore()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => const RestaurantRegisterPage()),
  ];
}
