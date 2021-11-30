import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pscomidas/app/modules/register_client/pages/confirm_phone/confirm_phone_page.dart';
import 'package:pscomidas/app/modules/register_client/pages/register_client_page/register_client_page.dart';
import 'package:pscomidas/app/modules/register_client/register_client_repository.dart';
import 'package:pscomidas/app/modules/register_client/register_client_store.dart';

class RegisterClientModule extends Module {
  static String get routeName => '/register';
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => RegisterClientRepository(FirebaseAuth.instance)),
    Bind.lazySingleton((i) => RegisterClientStore()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => const RegisterClientPage()),
    ChildRoute(ConfirmPhonePage.routeName,
        child: (_, args) => const ConfirmPhonePage()),
  ];
}
