import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:pscomidas/app/global/widgets/app_bar/components/components_app_bar.dart';
import 'package:pscomidas/app/modules/home/home_module.dart';

import '../auth_store.dart';

class VerifyScreen extends StatefulWidget {
  static String get routeName => '/verify-email';
  const VerifyScreen({Key? key}) : super(key: key);

  @override
  _VerifyScreenState createState() => _VerifyScreenState();
}

class _VerifyScreenState extends State<VerifyScreen> {
  final AuthStore store = Modular.get();
  final auth = FirebaseAuth.instance;
  late Timer timer;

  List<ReactionDisposer> disposers = [];

  @override
  void initState() {
    timer = Timer.periodic(const Duration(seconds: 5), (timer) {
      store.checkEmailVerified();
    });
    disposers.add(
      reaction(
        (_) => store.emailVerified == true,
        (_) => Modular.to
            .pushNamedAndRemoveUntil(HomeModule.routeName, (p0) => false),
      ),
    );
    super.initState();
  }

  @override
  void dispose() {
    timer.cancel();
    for (var i in disposers) {
      i.call();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          LogoAppBar(),
          SizedBox(height: 40),
          Text(
              'Um link de verificação foi enviado para o seu email. Por favor, cheque a sua caixa de entrada!'),
        ],
      ),
    );
  }
}
