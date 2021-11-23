import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobx/mobx.dart';
import 'package:pscomidas/app/modules/home/schemas.dart';
import 'package:pscomidas/app/modules/register_client/widgets/custom_submit.dart';
import 'package:pscomidas/app/modules/register_client/widgets/custom_text_field.dart';
import 'package:pscomidas/app/modules/update_client_data/update_client_data_store.dart';

class ConfirmNewPhonePage extends StatefulWidget {
  static String get routeName => 'confirm_new_phone';
  const ConfirmNewPhonePage({Key? key}) : super(key: key);

  @override
  _ConfirmNewPhonePageState createState() => _ConfirmNewPhonePageState();
}

class _ConfirmNewPhonePageState extends State<ConfirmNewPhonePage> {
  final UpdateClientDataStore store = Modular.get();
  final GlobalKey<FormState> _formKey =
      GlobalKey<FormState>(debugLabel: 'CheckNewPhonePage');

  TextStyle get fontFamily => GoogleFonts.getFont('Nunito', fontSize: 16.0);
  List<ReactionDisposer> disposers = [];

  @override
  void initState() {
    disposers = [
      reaction(
        (_) => store.updated,
        (_) => Modular.to.navigate('/'),
      ),
      reaction(
        (_) => store.validatorPhone,
        (_) async {
          await store.updateClientData();
        },
      ),
      reaction(
        (_) => store.errorPhone != null,
        (_) => Flushbar(
          title: 'Ocorreu um erro ao confirmar o telefone:',
          icon: const Icon(
            Icons.sentiment_dissatisfied_outlined,
            color: Colors.white70,
          ),
          message: store.errorPhone,
          backgroundColor: secondaryCollor,
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
              store.errorPhone = null;
              Navigator.pop(context);
            },
          ),
        ).show(context),
      ),
      reaction(
        (_) => store.errorMessage != null,
        (_) => Flushbar(
          title: 'Ocorreu um erro ao confirmar o telefone:',
          icon: const Icon(
            Icons.sentiment_dissatisfied_outlined,
            color: Colors.white70,
          ),
          message: store.errorMessage,
          backgroundColor: secondaryCollor,
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
    ];
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

    return SafeArea(
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
            decoration: const BoxDecoration(
              color: Colors.white,
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
                        'Verificação de telefone',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 23.0,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Text(
                        'Insira o código que enviamos para seu telefone para continuar',
                        style: fontFamily,
                      ),
                    ),
                    const SizedBox(height: 20),
                    CustomTextField(
                      controller: store.codeController,
                      title: 'Código de Confirmação',
                      phone: true,
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return 'Insira um código válido';
                        }
                        if (value.length != 6) {
                          return 'O código deve ter 6 dígitos';
                        }
                      },
                    ),
                    const SizedBox(height: 20),
                    CustomSubmit(
                      label: 'Enviar',
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          await store.verifyCode();
                        }
                      },
                    ),
                    const SizedBox(height: 10),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
