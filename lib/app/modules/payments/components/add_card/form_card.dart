import 'package:cpf_cnpj_validator/cpf_validator.dart';
import 'package:credit_card_validator/credit_card_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:pscomidas/app/global/utils/schemas.dart';
import 'package:pscomidas/app/modules/payments/components/add_card/TextField/text_field_card.dart';
import 'package:pscomidas/app/modules/payments/payments_store.dart';
import 'package:pscomidas/app/modules/register_client/widgets/custom_text_field.dart';

class FormCard extends StatefulWidget {
  const FormCard({Key? key}) : super(key: key);

  @override
  _FormCardState createState() => _FormCardState();
}

class _FormCardState extends State<FormCard> {
  @override
  Widget build(BuildContext context) {
    CreditCardValidator _ccValidator = CreditCardValidator();
    PaymentsStore store = Modular.get();

    return Material(
      child: SizedBox(
        width: 300,
        height: 450,
        child: Padding(
          padding: const EdgeInsets.only(
            left: 20.0,
            right: 20.0,
          ),
          child: LayoutBuilder(
            builder: (_, constraints) {
              return ListView(
                children: [
                  Observer(builder: (_) {
                    return Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text('Dados do cartão'),
                          store.dataInvalid
                              ? const Text(
                                  'Preencha todos os campos corretamente',
                                  style: TextStyle(
                                      fontFamily: 'Nunito', color: Colors.red),
                                )
                              : const Text(''),
                        ]);
                  }),
                  const SizedBox(
                    height: 10,
                  ),
                  Observer(builder: (_) {
                    return SizedBox(
                        width: 100,
                        child: textFormCard(
                            hintText: 'Numero do cartão',
                            validation: (numeroCartao) {
                              var isValid = _ccValidator
                                  .validateCCNum(numeroCartao)
                                  .isValid;
                              if (numeroCartao!.isEmpty) {
                                store.setValidNumCard(false);
                                return 'Campo obrigatorio';
                              } else if (!isValid) {
                                store.setValidNumCard(false);
                                return 'Numero de cartão invalido';
                              }
                              store.setValidNumCard(true);
                            },
                            controller: store.numeroCartaoControlle));
                  }),
                  const SizedBox(
                    height: 30,
                  ),
                  Observer(builder: (_) {
                    return SizedBox(
                        width: 100,
                        child: textFormCard(
                            hintText: 'Nome impresso',
                            validation: (nomeImpresso) {
                              if (nomeImpresso!.isEmpty) {
                                store.setValidNomeImpresso(false);
                                return 'Campo obrigatori';
                              }
                              store.setValidNomeImpresso(true);
                            },
                            controller: store.nomeImpressoControlle));
                  }),
                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Observer(builder: (_) {
                        return SizedBox(
                            width: 100,
                            child: textFormCard(
                                hintText: 'Validade',
                                validation: (validade) {
                                  var isValid = _ccValidator
                                      .validateExpDate(validade)
                                      .isValid;
                                  if (validade!.isEmpty) {
                                    store.setValidValidade(false);
                                    return 'Campo obrigatorio';
                                  } else if (isValid == false) {
                                    store.setValidValidade(false);
                                    return 'Data invalida';
                                  }
                                  store.setValidValidade(true);
                                },
                                controller: store.validadeControlle));
                      }),
                      Observer(builder: (_) {
                        return SizedBox(
                            width: 100,
                            child: textFormCard(
                                hintText: 'CVV',
                                validation: (cvv) {
                                  if (cvv!.isEmpty) {
                                    store.setValidCVV(false);
                                    return 'Campo obrigatorio';
                                  } else if (cvv.length != 3) {
                                    store.setValidCVV(false);
                                    return 'CVV invalido';
                                  }
                                  store.setValidCVV(true);
                                },
                                controller: store.cvvControlle));
                      }),
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Observer(builder: (_) {
                    return CustomTextField(
                      controller: store.cpfControlle,
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
                    );
                  }),
                  const SizedBox(
                    height: 30,
                  ),
                  Observer(
                    builder: (_) {
                      return ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: secondaryColor,
                            fixedSize: const Size(100, 50)),
                        onPressed: () {
                          if (store.isValidData()) {
                            store.cartaoAdicionar();
                            store.setDataInvalid(false);
                            store.clear();
                            final snackBar = SnackBar(
                              backgroundColor: Colors.red,
                              content: const Text('Cartão adiciondado'),
                              action: SnackBarAction(
                                label: 'Sair',
                                textColor: Colors.white,
                                onPressed: () {},
                              ),
                            );
                            ScaffoldMessenger.of(context)
                                .showSnackBar(snackBar);

                            Navigator.of(context).pop();
                          } else {
                            store.setDataInvalid(true);
                          }
                        },
                        child: const Text('Adicionar'),
                      );
                    },
                  )
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
