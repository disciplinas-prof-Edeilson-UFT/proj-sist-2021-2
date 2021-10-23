import 'package:firebase_auth/firebase_auth.dart';
import 'package:pscomidas/app/modules/auth/auth_page.dart';
import 'package:pscomidas/app/modules/auth/auth_repository.dart';
import 'package:pscomidas/app/modules/auth/auth_store.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pscomidas/app/modules/auth/pages/verify_screen.dart';

class AuthModule extends Module {
  static String get routeName => '/auth';
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => AuthRepository(FirebaseAuth.instance)),
    Bind.lazySingleton((i) => AuthStore(i.get())),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => const AuthPage()),
    ChildRoute(VerifyScreen.routeName,
        child: (_, args) => const VerifyScreen()),
  ];
}
