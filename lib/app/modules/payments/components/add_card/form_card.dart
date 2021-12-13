import 'package:another_flushbar/flushbar.dart';
import 'package:cpf_cnpj_validator/cpf_validator.dart';
import 'package:credit_card_validator/credit_card_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:pscomidas/app/modules/payments/components/add_card/TextField/text_field_card.dart';
import 'package:pscomidas/app/modules/payments/payments_store.dart';
import 'package:pscomidas/app/modules/register_client/widgets/custom_submit.dart';

class FormCard extends StatefulWidget {
  @override
  _FormCardState createState() => _FormCardState();
}

class _FormCardState extends State<FormCard> {
  @override
  Widget build(BuildContext context) {
    CreditCardValidator _ccValidator = CreditCardValidator();
    PaymentsStore store = Modular.get();
    var ccNum;
    final _formKey = GlobalKey<FormState>();
    return Material(
      child: SizedBox(
        width: 300,
        height: 450,
        child: Padding(
          padding: const EdgeInsets.only(
            left: 20.0,
            right: 20.0,
          ),
          child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    "Cadastar um novo cartão",
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'Nunito',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Text(
                    "Insisra os dados corretamente",
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'Nunito',
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  TextFieldCard(
                    controller: store.numeroCartaoControlle,
                    formaters: [
                      MaskTextInputFormatter(
                        mask: '#### #### #### ####',
                        filter: {"#": RegExp(r'[0-9]')},
                      )
                    ],
                    hint: 'Numero do cartão',
                    validator: (value) {
                      ccNum = _ccValidator.validateCCNum(value!).isValid;
                      if (!ccNum) {
                        return 'Cartão invalido';
                      } else if (value == '') {
                        return 'Campo obrigatorio';
                      }
                    },
                  ),
                  TextFieldCard(
                    controller: store.nomeImpressoControlle,
                    formaters: const [],
                    hint: 'Nome no cartão',
                    validator: (value) {
                      if (value == '') {
                        return 'Campo obrigatorio';
                      }
                    },
                  ),
                  TextFieldCard(
                    controller: store.validadeControlle,
                    formaters: [
                      MaskTextInputFormatter(
                        mask: '##/####',
                        filter: {"#": RegExp(r'[0-9]')},
                      )
                    ],
                    hint: 'Data',
                    validator: (data) {
                      var isValid = _ccValidator.validateExpDate(data!).isValid;
                      if (!isValid) {
                        return 'Cartoào invalido';
                      } else if (data == '') {
                        return 'Campo obrigatorio';
                      }
                    },
                  ),
                  TextFieldCard(
                    controller: store.cvvControlle,
                    formaters: [
                      MaskTextInputFormatter(
                        mask: '###',
                        filter: {"#": RegExp(r'[0-9]')},
                      )
                    ],
                    hint: 'cvv',
                    validator: (cvv) {
                      if (cvv!.isEmpty) {
                        store.setValidCVV(false);
                        return 'Campo obrigatorio';
                      } else if (cvv.length != 3) {
                        store.setValidCVV(false);
                        return 'CVV invalido';
                      }
                    },
                  ),
                  TextFieldCard(
                    controller: store.cpfControlle,
                    formaters: [
                      MaskTextInputFormatter(
                        mask: '###.###.###-##',
                        filter: {"#": RegExp(r'[0-9]')},
                      )
                    ],
                    hint: 'CPF',
                    validator: (value) {
                      if (!CPFValidator.isValid(value)) {
                        return 'CPF inválido';
                      } else if (value == '') {
                        return 'Campo obrigatorio';
                      }
                    },
                  ),
                  CustomSubmit(
                    label: 'Eviar',
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        store.cartaoAdicionar();
                        store.setDataInvalid(false);
                        store.clear();
                        cardAlert('Cartão cadastrado', Colors.green);
                        Navigator.of(context).pop();
                      } else {
                        cardAlert('Cartão invalido', Colors.red);
                      }
                    },
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Flushbar cardAlert(String message, Color color) {
    return Flushbar(
      message: message,
      icon: const Icon(
        Icons.verified,
        color: Colors.white,
      ),
      backgroundColor: color,
      duration: const Duration(seconds: 2),
      borderRadius: BorderRadius.circular(10.0),
      padding: const EdgeInsets.all(20.0),
      margin: const EdgeInsets.symmetric(
        horizontal: 100.0,
        vertical: 10.0,
      ),
    );
  }
}
