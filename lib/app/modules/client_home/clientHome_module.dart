import 'package:pscomidas/app/modules/client_home/clientHome_Page.dart';
import 'package:pscomidas/app/modules/client_home/clientHome_store.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ClientHomeModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => ClientHomeStore()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => ClientHomePage()),
  ];
}
