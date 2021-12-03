import 'package:another_flushbar/flushbar.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:mobx/mobx.dart';
import 'package:pscomidas/app/global/utils/schemas.dart';
import 'package:pscomidas/app/global/widgets/app_bar/custom_app_bar.dart';
import 'package:pscomidas/app/modules/register_client/widgets/custom_submit.dart';
import 'package:pscomidas/app/modules/register_client/widgets/custom_text_field.dart';

import '../update_client_data_store.dart';

class UpdateClientDataPage extends StatefulWidget {
  final String title;
  const UpdateClientDataPage({Key? key, this.title = 'ChangeClientDataPage'})
      : super(key: key);
  @override
  UpdateClientDataPageState createState() => UpdateClientDataPageState();
}

class UpdateClientDataPageState extends State<UpdateClientDataPage> {
  final UpdateClientDataStore store = Modular.get();

  TextStyle get fontFamily => GoogleFonts.getFont('Nunito', fontSize: 16.0);

  TextStyle get digitedText => GoogleFonts.getFont('Nunito', fontSize: 14.0);

  final _formKey = GlobalKey<FormState>();
  List<ReactionDisposer> disposers = [];

  @override
  void initState() {
    disposers = [
      reaction(
        (_) => store.updated,
        (_) => Modular.to.navigate('/'),
      ),
      reaction(
        (_) => store.errorMessage != null,
        (_) => Flushbar(
          title: 'Ocorreu um erro ao editar seus dados:',
          icon: const Icon(
            Icons.sentiment_dissatisfied_outlined,
            color: Colors.white70,
          ),
          message: store.errorMessage,
          backgroundColor: secondaryColor,
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
    store.getClientData();
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
    return Scaffold(
      appBar: const CustomAppBar(),
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            width: screen.width > 1069
                ? screen.width * .35
                : screen.width > 750
                    ? screen.width * .5
                    : screen.width,
            padding: const EdgeInsets.all(40.0),
            decoration: const BoxDecoration(
              color: Colors.white24,
            ),
            child: Observer(builder: (_) {
              if (store.user == null) {
                return const Center(
                  child: CircularProgressIndicator(
                    color: secondaryColor,
                  ),
                );
              }
              return Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    const Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Text(
                        'Editar dados',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 25.0,
                        ),
                      ),
                    ),
                    const SizedBox(height: 15),
                    CustomTextField(
                      controller: store.nameController,
                      title: 'Nome',
                      hint: 'Insira seu nome',
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Nome completo inválido';
                        }
                      },
                    ),
                    const SizedBox(height: 10),
                    CustomTextField(
                      controller: store.cpfController,
                      readOnly: true,
                      title: 'CPF',
                    ),
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
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Telefone inválido';
                        }
                      },
                    ),
                    const SizedBox(height: 10),
                    CustomTextField(
                      controller: store.emailController,
                      title: 'E-mail',
                      readOnly: true,
                    ),
                    const SizedBox(height: 20),
                    CustomSubmit(
                      label: 'Confirmar',
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          store.redirectUpdate();
                        }
                      },
                    ),
                    const SizedBox(height: 10),
                  ],
                ),
              );
            }),
          ),
        ),
      ),
    );
  }
}
