import 'package:another_flushbar/flushbar.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:pscomidas/app/modules/auth/auth_store.dart';
import 'package:flutter/material.dart';

class AuthPage extends StatefulWidget {
  final String title;
  const AuthPage({Key? key, this.title = 'AuthPage'}) : super(key: key);
  @override
  AuthPageState createState() => AuthPageState();
}

class AuthPageState extends State<AuthPage> {
  final AuthStore store = Modular.get();

  List<ReactionDisposer> disposers = [];

  @override
  void initState() {
    disposers.add(
      reaction(
        (_) => store.logged == true,
        (_) => Navigator.pushNamed(context, '/'),
      ),
    );
    disposers.add(
      reaction(
        (_) => store.errorMessage.isNotEmpty,
        (_) {
          Flushbar(
            title: 'Ocorreu um erro ao tentar fazer login:',
            icon: const Icon(
              Icons.sentiment_dissatisfied_outlined,
            ),
            message: store.errorMessage,
            backgroundColor: Colors.red,
            borderRadius: BorderRadius.circular(10.0),
            padding: const EdgeInsets.all(20.0),
            margin:
                const EdgeInsets.symmetric(horizontal: 100.0, vertical: 10.0),
            animationDuration: const Duration(seconds: 1),
          ).show(context);
        },
      ),
    );
    super.initState();
  }

  @override
  void dispose() {
    store.dispose();
    store.emailController.text = '';
    store.passwordController.text = '';
    for (var i = 0; i <= disposers.length; i++) {
      dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              TextFormField(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                controller: store.emailController,
              ),
              TextFormField(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                controller: store.passwordController,
              ),
              ElevatedButton(
                onPressed: () async {
                  await store.logFace();
                  if (Form.of(context)!.validate()) {}
                },
                child: const Text('Login'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
