import 'package:firebase_auth/firebase_auth.dart';
import 'package:pscomidas/app/modules/register/register_page.dart';
import 'package:pscomidas/app/modules/register/register_repository.dart';
import 'package:pscomidas/app/modules/register/register_store.dart';
import 'package:flutter_modular/flutter_modular.dart';

class RegisterModule extends Module {
  static String get routeName => '/register';
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => RegisterRepository(FirebaseAuth.instance)),
    Bind.lazySingleton((i) => RegisterStore()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => const RegisterPage()),
  ];
}
