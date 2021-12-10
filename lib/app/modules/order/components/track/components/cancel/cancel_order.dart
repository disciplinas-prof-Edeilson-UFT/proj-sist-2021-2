import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pscomidas/app/global/utils/schemas.dart';
import 'package:pscomidas/app/modules/order/components/track/components/cancel/class/cancel_store.dart';
import 'package:pscomidas/app/modules/order/order_store.dart';

class CancelOrder extends StatefulWidget {
  const CancelOrder({Key? key}) : super(key: key);

  @override
  _CancelOrderState createState() => _CancelOrderState();
}

class _CancelOrderState extends State<CancelOrder> {
  var controller = CancelStore();
  final OrderStore store = Modular.get();

  @override
  Widget build(BuildContext context) {
    return TextButton(
        style: TextButton.styleFrom(primary: secondaryColor),
        child: const Text('Cancelar',
            style: TextStyle(
                fontFamily: 'Nunito',
                fontSize: 15,
                fontWeight: FontWeight.bold)),
        onPressed: () => {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return SingleChildScrollView(
                    child: AlertDialog(
                      title: const Text('Cancelar pedido',
                          style: TextStyle(fontFamily: 'Nunito')),
                      content: Column(children: [
                        Observer(
                          builder: (_) {
                            return _checkList('Errei a forma de pagamento',
                                controller.payments);
                          },
                        ),
                        Observer(
                          builder: (_) {
                            return _checkList(
                                'Endereço está incorreto', controller.adress);
                          },
                        ),
                        Observer(
                          builder: (_) {
                            return _checkList('Prato errado ou item faltando',
                                controller.pratoErrado);
                          },
                        ),
                        Observer(
                          builder: (_) {
                            return _checkList(
                                'Comprei sem querer', controller.compraErrada);
                          },
                        ),
                        Observer(
                          builder: (_) {
                            return _checkList(
                                'Horário de entrega é muito tarde',
                                controller.horario);
                          },
                        ),
                        Observer(
                          builder: (_) {
                            return _checkList('Outros', controller.outros);
                          },
                        )
                      ]),
                      actions: [
                        TextButton(
                          child: const Text('Cancelar',
                              style: TextStyle(
                                  fontSize: 20,
                                  fontFamily: 'Nunito',
                                  color: tertiaryColor)),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                        const SizedBox(
                          width: 130,
                        ),
                        Observer(builder: (_) {
                          return controller.confirm()
                              ? _buttonConfirm()
                              : Container();
                        })
                      ],
                    ),
                  );
                },
              ),
            });
  }

  /// [CheckBoxs]
  Widget _checkList(String text, bool isChecked) {
    return CheckboxListTile(
      title: Text(text),
      value: isChecked,
      onChanged: (value) {
        if (text == 'Errei a forma de pagamento') {
          controller.setCheckedPayments(value!);
        } else if (text == 'Endereço está incorreto') {
          controller.setCheckedAdress(value!);
        } else if (text == 'Prato errado ou item faltando') {
          controller.setCheckedPrato(value!);
        } else if (text == 'Comprei sem querer') {
          controller.setCheckedCompra(value!);
        } else if (text == 'Horário de entrega é muito tarde') {
          controller.setCheckedHorario(value!);
        } else if (text == 'Outros') {
          controller.setCheckedOutros(value!);
        }
      },
      activeColor: secondaryColor,
      checkColor: Colors.white,
      controlAffinity: ListTileControlAffinity.leading,
    );
  }

  /// [Botão de confirmação]
  Widget _buttonConfirm() {
    return TextButton(
        child: const Text('Confirmar',
            style: TextStyle(
                fontSize: 20, fontFamily: 'Nunito', color: secondaryColor)),
        onPressed: () {
          Navigator.of(context).pop();
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: const Text("Pedido cancelado"),
                actions: <Widget>[
                  // define os botões na base do dialogo
                  ElevatedButton(
                    child: const Text("Fechar",
                        style: TextStyle(color: primaryColor)),
                    style: ElevatedButton.styleFrom(
                      primary: secondaryColor,
                    ),
                    onPressed: () {
                      Modular.to.navigate('/');
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              );
            },
          );
        });
  }
}
