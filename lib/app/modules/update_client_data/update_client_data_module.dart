import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pscomidas/app/modules/register_client/register_client_repository.dart';

import 'update_client_data_page.dart';
import 'update_client_data_store.dart';

class ChangeClientDataModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => ChangeClientDataStore()),
    Bind.lazySingleton((i) => RegisterClientRepository(FirebaseAuth.instance))
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => const ChangeClientDataPage()),
  ];
}
