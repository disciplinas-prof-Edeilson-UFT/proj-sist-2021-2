import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:pscomidas/app/modules/home/schemas.dart';
import 'package:pscomidas/app/modules/order/components/track/components/cancel/class/cancel_checked.dart';

class CancelOrder extends StatefulWidget {
  const CancelOrder({Key? key}) : super(key: key);

  @override
  _CancelOrderState createState() => _CancelOrderState();
}

class _CancelOrderState extends State<CancelOrder> {
  var controller = CancelChecked();

  @override
  Widget build(BuildContext context) {
    return TextButton(
        style: TextButton.styleFrom(primary: secondaryCollor),
        child: const Text('Cancelar',
            style: TextStyle(
                fontFamily: 'Nunito',
                fontSize: 15,
                fontWeight: FontWeight.bold)),
        onPressed: () => showDialog(
            context: context,
            builder: (BuildContext context) {
              return SingleChildScrollView(
                child: AlertDialog(
                  title: const Text('Cancelar padido',
                      style: TextStyle(fontFamily: 'Nunito')),
                  content: Column(children: [
                    Observer(
                      builder: (_) {
                        return _checkList(
                            'Errei a forma de pagamento', controller.payments);
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
                        return _checkList('Horário de entrega é muito tarde',
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
                              color: tertiaryCollor)),
                      onPressed: () => Navigator.of(context).pop(),
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
            }));
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
      activeColor: secondaryCollor,
      checkColor: Colors.white,
      controlAffinity: ListTileControlAffinity.leading,
    );
  }

  /// [Botão de confirmação]
  Widget _buttonConfirm() {
    return TextButton(
        child: const Text('Confirmar',
            style: TextStyle(
                fontSize: 20, fontFamily: 'Nunito', color: secondaryCollor)),
        onPressed: () {
          final snackBar = SnackBar(
            backgroundColor: secondaryCollor,
            behavior: SnackBarBehavior.floating,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            content: const Text(
              'Pedido cancelado',
              style:
                  TextStyle(fontFamily: 'Nunito', fontWeight: FontWeight.bold),
            ),
            action: SnackBarAction(
              textColor: primaryCollor,
              label: 'Sair',
              onPressed: () => {},
            ),
          );
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
          Navigator.of(context).pop();
        });
  }
}
