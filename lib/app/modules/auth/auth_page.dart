import 'package:another_flushbar/flushbar.dart';
import 'package:email_validator/email_validator.dart';
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

bool _showPassword = false;

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
              color: Colors.white70,
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
    Size screen = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white70,
      body: SafeArea(
        child: Row(
          children: [
            Expanded(
              child: Image.asset(
                'assets/images/auth-back.jpg',
                fit: BoxFit.cover,
              ),
            ),
            Form(
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 100.0,
                  vertical: 20.0,
                ),
                width: screen.width * 0.45,
                height: screen.height,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          "assets/images/logo.png",
                          width: 220,
                        ),
                      ],
                    ),
                    const SizedBox(height: 40),
                    const Text(
                      'Falta pouco para matar a sua fome!',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 25,
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'Como deseja continuar?',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.grey,
                      ),
                    ),
                    const SizedBox(height: 20),
                    SizedBox(
                      child: TextFormField(
                        validator: (email) =>
                            email != null && !EmailValidator.validate(email)
                                ? 'E-mail Inválido'
                                : null,
                        decoration: InputDecoration(
                          hintText: 'E-mail',
                          focusedBorder: const OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.red),
                          ),
                          border: OutlineInputBorder(
                            borderSide:
                                const BorderSide(width: 3, color: Colors.red),
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                        cursorColor: Colors.red,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        controller: store.emailController,
                      ),
                    ),
                    const SizedBox(height: 10),
                    SizedBox(
                      child: TextFormField(
                        decoration: InputDecoration(
                          hintText: 'Senha',
                          focusedBorder: const OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.red),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                          suffixIcon: IconButton(
                            icon: Icon(
                              _showPassword == false
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                              color: Colors.black87,
                            ),
                            hoverColor: Colors.transparent,
                            onPressed: () {
                              setState(() => _showPassword = !_showPassword);
                            },
                          ),
                        ),
                        cursorColor: Colors.red,
                        obscureText: _showPassword == false ? true : false,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        controller: store.passwordController,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          'Esqueci minha senha',
                          style: TextStyle(
                            color: Colors.red[700],
                            fontSize: 15,
                            decoration: TextDecoration.none,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Row(
                      children: [
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () async {
                              if (Form.of(context)!.validate()) {
                                await store.login();
                              }
                            },
                            style: ButtonStyle(
                              fixedSize: MaterialStateProperty.all(
                                  const Size.fromHeight(50)),
                              backgroundColor:
                                  MaterialStateProperty.all(Colors.red),
                              shadowColor:
                                  MaterialStateProperty.all(Colors.black12),
                              shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5.0),
                                ),
                              ),
                            ),
                            child: const Text(
                              'Avançar',
                              style: TextStyle(fontSize: 20.0),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: ElevatedButton.icon(
                            onPressed: () async {
                              await store.logGoogle();
                            },
                            icon: SizedBox(
                              width: 35,
                              height: 35,
                              child: Image.asset(
                                'images/google.png',
                              ),
                            ),
                            label: const Text(
                              'Continuar com Google',
                              style: TextStyle(
                                color: Colors.black87,
                              ),
                            ),
                            style: ButtonStyle(
                              fixedSize: MaterialStateProperty.all(
                                  const Size.fromHeight(50)),
                              backgroundColor:
                                  MaterialStateProperty.all(Colors.white),
                              overlayColor:
                                  MaterialStateProperty.all(Colors.black12),
                              shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5.0),
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 20),
                        Expanded(
                          child: ElevatedButton.icon(
                            onPressed: () async {
                              await store.logFace();
                            },
                            icon: const Icon(
                              Icons.facebook_outlined,
                              size: 35,
                            ),
                            label: const Text('Continuar com Facebook'),
                            style: ButtonStyle(
                              fixedSize: MaterialStateProperty.all(
                                  const Size.fromHeight(50)),
                              backgroundColor:
                                  MaterialStateProperty.all(Colors.blue[700]),
                              shadowColor:
                                  MaterialStateProperty.all(Colors.black12),
                              shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5.0),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
