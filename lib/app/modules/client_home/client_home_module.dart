import 'package:pscomidas/app/modules/client_home/client_home_page.dart';
import 'package:pscomidas/app/modules/client_home/client_home_store.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ClientHomeModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => ClientHomeStore()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => const ClientHomePage()),
  ];
}
