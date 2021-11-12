import 'package:another_flushbar/flushbar.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobx/mobx.dart';
import 'package:pscomidas/app/global/widgets/app_bar/components/components_app_bar.dart';
import 'package:pscomidas/app/modules/auth/auth_store.dart';
import 'package:flutter/material.dart';
import 'package:pscomidas/app/modules/auth/pages/verify_screen.dart';
import 'package:pscomidas/app/modules/home/home_module.dart';
import 'package:pscomidas/app/modules/register_client/register_client_module.dart';

class AuthPage extends StatefulWidget {
  final String title;
  const AuthPage({Key? key, this.title = 'AuthPage'}) : super(key: key);
  @override
  AuthPageState createState() => AuthPageState();
}

bool _showPassword = false;

class AuthPageState extends State<AuthPage> {
  final AuthStore store = Modular.get();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  List<ReactionDisposer> disposers = [];

  @override
  void initState() {
    disposers = [
      reaction(
        (_) => store.logged == true,
        (_) => Modular.to.navigate(HomeModule.routeName),
      ),
      reaction(
        (_) => store.emailVerified == false,
        (_) => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const VerifyScreen(),
          ),
        ),
      ),
      reaction(
        (_) => store.emailexiste == false,
        (_) => showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: const Text(
                'O e-mail não foi encontrado',
                style: TextStyle(color: Colors.red),
              ),
              content: const Text(
                  'Caso não seja nosso cliente ainda, crie uma nova conta!'),
              actions: <Widget>[
                ElevatedButton(
                  onPressed: () {
                    store.emailexiste = true;
                    Navigator.pop(context, 'Cancelar');
                  },
                  child: const Text(
                    'Tentar Novamente',
                    style: TextStyle(
                      color: Colors.black87,
                      fontSize: 15,
                      decoration: TextDecoration.none,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    fixedSize: const Size.fromHeight(30),
                    primary: Colors.white,
                  ),
                ),
                ElevatedButton(
                  onPressed: () =>
                      Modular.to.navigate(RegisterClientModule.routeName),
                  child: const Text(
                    'Criar conta',
                    style: TextStyle(
                      color: Colors.red,
                      fontSize: 15,
                      decoration: TextDecoration.none,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    fixedSize: const Size.fromHeight(30),
                    primary: Colors.white,
                  ),
                ),
              ],
            );
          },
        ),
      ),
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
            animationDuration: const Duration(milliseconds: 500),
            shouldIconPulse: false,
            mainButton: TextButton(
              child: const Text(
                'Fechar',
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () {
                store.errorMessage = '';
                Navigator.pop(context);
              },
            ),
          ).show(context);
        },
      ),
    ];
    WidgetsFlutterBinding.ensureInitialized();
    super.initState();
  }

  @override
  void dispose() {
    store.dispose();
    for (var element in disposers) {
      element.call();
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
            if (screen.width > 1069) ...[
              Expanded(
                child: Image.asset(
                  'images/auth-back.jpg',
                  fit: BoxFit.cover,
                ),
              ),
            ],
            Form(
              key: _formKey,
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 100.0,
                  vertical: 20.0,
                ),
                width: screen.width > 1069 ? screen.width * .45 : screen.width,
                height: screen.height,
                child: SingleChildScrollView(
                  padding: const EdgeInsets.only(top: 100),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          LogoAppBar(),
                        ],
                      ),
                      const SizedBox(height: 40),
                      const Text(
                        'Falta pouco para \nmatar a sua fome!',
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
                          validator: (senha) {
                            if (senha == null || senha.isEmpty) {
                              return 'Campo Obrigatório';
                            } else if (senha.length < 6) {
                              return 'Deve ter no mínimo 6 caractéres';
                            }
                          },
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
                                if (_formKey.currentState!.validate()) {
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
                              label: Text(
                                screen.width < 630
                                    ? 'Google'
                                    : 'Entrar com Google',
                                style: const TextStyle(
                                  color: Colors.black87,
                                ),
                              ),
                              style: ElevatedButton.styleFrom(
                                fixedSize: const Size.fromHeight(50),
                                primary: Colors.white,
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
                              label: Text(
                                screen.width < 630
                                    ? 'Facebook'
                                    : 'Entrar com Facebook',
                              ),
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
                      ),
                      const SizedBox(height: 20),
                      Row(
                        children: [
                          Expanded(
                            child: ElevatedButton(
                              onPressed: () {
                                Modular.to
                                    .navigate(RegisterClientModule.routeName);
                              },
                              style: ElevatedButton.styleFrom(
                                fixedSize: const Size.fromHeight(50),
                                primary: Colors.white,
                              ),
                              child: Text(
                                'Ainda não tenho conta',
                                style: TextStyle(
                                  fontFamily:
                                      GoogleFonts.getFont('Nunito').fontFamily,
                                  color: Colors.red,
                                  fontSize: 16.0,
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
            ),
          ],
        ),
      ),
    );
  }
}
