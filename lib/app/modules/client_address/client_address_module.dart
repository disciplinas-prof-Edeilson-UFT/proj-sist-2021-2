import 'package:flutter_modular/flutter_modular.dart';
import 'package:pscomidas/app/modules/client_address/client_address_store.dart';

import 'client_address_page.dart';

class ClientAddressModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => ClientAddressStore()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => const ClientAddressPage()),
  ];
}
