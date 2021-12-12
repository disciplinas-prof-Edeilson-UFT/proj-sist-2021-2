import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pscomidas/app/global/repositories/paymentcard/payment_card.dart';
import 'package:pscomidas/app/global/utils/schemas.dart';
import 'package:pscomidas/app/modules/payments/payments_store.dart';

class BtnExcluir extends StatefulWidget {
  const BtnExcluir({Key? key}) : super(key: key);

  @override
  _BtnExcluirState createState() => _BtnExcluirState();
}

class _BtnExcluirState extends State<BtnExcluir> {
  final PaymentsStore store = Modular.get();
  final PaymentCardRepository cardRepository = Modular.get();
  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () => showDialog<String>(
              context: context,
              builder: (BuildContext context) => AlertDialog(
                title: const Text(
                  'Quer excluir este cartão?',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                content: const Text(
                    'Ao confirmar, (apelido do cartão), final (os 4 numeros finais) \n'
                    'não estará mais disponível na sua lista de cartões salvos no site.'),
                actions: [
                  Center(
                    child: Column(children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            fixedSize: const Size(250, 40),
                            primary: secondaryColor),
                        onPressed: () => Navigator.pop(context),
                        child: const Text('Excluir cartão'),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: const Text(
                          'Cancelar',
                          style: TextStyle(color: secondaryColor),
                        ),
                      ),
                    ]),
                  )
                ],
              ),
            ),
        tooltip: 'Deletar',
        icon: const Icon(Icons.delete, color: secondaryColor));
  }
}
