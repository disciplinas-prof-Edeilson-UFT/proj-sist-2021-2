import 'package:another_flushbar/flushbar.dart';
import 'package:cpf_cnpj_validator/cpf_validator.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:mobx/mobx.dart';
import 'package:pscomidas/app/modules/auth/auth_module.dart';
import 'package:flutter/material.dart';
import 'package:pscomidas/app/modules/home/schemas.dart';
import 'package:pscomidas/app/modules/register_client/register_client_store.dart';
import 'package:pscomidas/app/modules/register_client/widgets/custom_submit_button.dart';
import 'package:pscomidas/app/modules/register_client/widgets/custom_text_field.dart';

class RegisterClientPage extends StatefulWidget {
  final String title;
  const RegisterClientPage({Key? key, this.title = 'RegisterPage'})
      : super(key: key);
  @override
  RegisterClientPageState createState() => RegisterClientPageState();
}

class RegisterClientPageState extends State<RegisterClientPage> {
  final RegisterClientStore store = Modular.get();

  TextStyle get fontFamily => GoogleFonts.getFont('Sen', fontSize: 16.0);

  TextStyle get digitedText => GoogleFonts.getFont('Sen', fontSize: 14.0);

  final _formKey = GlobalKey<FormState>();
  List<ReactionDisposer> disposers = [];
  bool checked = false;

  @override
  void initState() {
    disposers.add(
      reaction(
        (_) => store.errorMessage != null,
        (_) => Flushbar(
          title: 'Ocorreu um erro ao registrar:',
          icon: const Icon(
            Icons.sentiment_dissatisfied_outlined,
            color: Colors.white70,
          ),
          message: store.errorMessage,
          backgroundColor: Colors.red,
          borderRadius: BorderRadius.circular(10.0),
          padding: const EdgeInsets.all(20.0),
          margin: const EdgeInsets.symmetric(
            horizontal: 100.0,
            vertical: 10.0,
          ),
          animationDuration: const Duration(milliseconds: 500),
          shouldIconPulse: false,
          mainButton: TextButton(
            child: const Text(
              'Fechar',
              style: TextStyle(color: Colors.white),
            ),
            onPressed: () {
              store.errorMessage = null;
              Navigator.pop(context);
            },
          ),
        ).show(context),
      ),
    );
    super.initState();
  }

  @override
  void dispose() {
    for (var i in disposers) {
      i.call();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size screen = MediaQuery.of(context).size;
    return MaterialApp(
      home: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('register_back.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: Scaffold(
            backgroundColor: Colors.transparent,
            body: Center(
              child: Container(
                width: screen.width > 1069
                    ? screen.width * .35
                    : screen.width > 750
                        ? screen.width * .5
                        : screen.width,
                padding: const EdgeInsets.all(40.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(5.0),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 2,
                      spreadRadius: 2,
                    )
                  ],
                ),
                child: Form(
                  key: _formKey,
                  child: SingleChildScrollView(
                    child: Column(
                      children: <Widget>[
                        Image.asset(
                          'assets/images/logo.png',
                          scale: 2.4,
                        ),
                        const Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Text(
                            'Falta pouco para matar sua fome!',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 23.0,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Text(
                            'Insira seus dados para iniciar o cadastro',
                            style: fontFamily,
                          ),
                        ),
                        const SizedBox(height: 20),
                        CustomTextField(
                          controller: store.nameController,
                          title: 'Nome',
                          hint: 'Insira seu nome completo',
                        ),
                        const SizedBox(height: 10),
                        CustomTextField(
                          controller: store.cpfController,
                          title: 'CPF',
                          hint: 'Insira seu CPF',
                          validator: (value) {
                            if (!CPFValidator.isValid(value)) {
                              return 'CPF inválido';
                            }
                          },
                          formaters: [
                            MaskTextInputFormatter(
                              mask: '###.###.###-##',
                              filter: {"#": RegExp(r'[0-9]')},
                            )
                          ],
                        ),
                        const SizedBox(height: 10),
                        CustomTextField(
                            controller: store.emailController,
                            title: 'E-mail',
                            hint: 'Insira seu email',
                            validator: (email) {
                              email != null && !EmailValidator.validate(email)
                                  ? 'E-mail Inválido'
                                  : null;
                            }),
                        const SizedBox(height: 10),
                        CustomTextField(
                          controller: store.phoneController,
                          title: 'Telefone com (DDD)',
                          hint: 'Insira seu telefone',
                          formaters: [
                            MaskTextInputFormatter(
                              mask: '+## (##) #####-####',
                              filter: {"#": RegExp(r'[0-9]')},
                            )
                          ],
                        ),
                        const SizedBox(height: 10),
                        CustomTextField(
                          isPassword: true,
                          controller: store.passwordController,
                          title: 'Senha',
                          hint: 'Insira sua senha',
                          validator: (value) {
                            if (value!.length < 6) {
                              return 'A senha deve ter no mínimo 6 caracteres';
                            }
                          },
                        ),
                        const SizedBox(height: 10),
                        CustomTextField(
                          isPassword: true,
                          controller: store.checkPasswordController,
                          title: 'Confirmação de senha',
                          hint: 'Insira novamente a senha',
                          validator: (value) {
                            if (value != store.passwordController.text) {
                              return 'As senhas não coincidem';
                            }
                          },
                        ),
                        const SizedBox(height: 20),
                        Wrap(
                          spacing: 5.0,
                          crossAxisAlignment: WrapCrossAlignment.center,
                          children: [
                            Checkbox(
                              value: checked,
                              onChanged: (value) {
                                setState(() {
                                  checked = value!;
                                });
                              },
                              activeColor: secondaryCollor,
                            ),
                            const SizedBox(
                              child: Text(
                                "Declaro que li e aceito os termos de uso",
                                maxLines: 3,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        CustomSubmit(
                          label: 'Enviar',
                          onPressed: () async {
                            if (_formKey.currentState!.validate() &&
                                checked != false) {
                              await store.checkData();
                            } else if (checked == false) {
                              store.termsValidation();
                            }
                          },
                        ),
                        const SizedBox(height: 10),
                        Row(
                          children: [
                            Expanded(
                              child: ElevatedButton(
                                onPressed: () {
                                  Modular.to.navigate(AuthModule.routeName);
                                },
                                style: ElevatedButton.styleFrom(
                                  fixedSize: const Size.fromHeight(40),
                                  primary: Colors.white,
                                ),
                                child: Text(
                                  'Já sou cadastrado',
                                  style: TextStyle(
                                    fontFamily: GoogleFonts.getFont('Nunito')
                                        .fontFamily,
                                    color: Colors.red,
                                    fontSize: 16.0,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
