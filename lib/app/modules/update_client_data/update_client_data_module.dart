import 'package:flutter_modular/flutter_modular.dart';

import 'update_client_data_page.dart';
import 'update_client_data_store.dart';

class UpdateClientDataModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => UpdateClientDataStore()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => const UpdateClientDataPage()),
  ];
}
