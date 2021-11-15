import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:pscomidas/app/global/utils/schemas.dart';
import 'package:pscomidas/app/modules/payments/components/cards_payments/list_card.dart';

class PaymentsBody extends StatefulWidget {
  const PaymentsBody({ Key? key }) : super(key: key);

  @override
  _PaymentsBodyState createState() => _PaymentsBodyState();
}

class _PaymentsBodyState extends State<PaymentsBody> {

  /// [DELETAR] variavel, serve apenas para o dev do front
  int tamanho_da_lista = 1;

  /// Substituir o "tamanho_da_lista", pelo numero de cartões 
  /// cadastrados do usuario
  double _sizeHeight(){
    switch(tamanho_da_lista){
      case 1:
        return 0.1;
      case 2:
        return 0.2;
      case 3:
        return 0.3;
      case 4:
        return 0.4;
      case 5:
        return 0.5;
      case 6:
        return 0.6;
      default: 
        return 0.6;
    }
  }

  @override
  Widget build(BuildContext context) {
    final Size screen = MediaQuery.of(context).size;
    return Scaffold(
      body: Center(
      child: Padding(
        padding: const EdgeInsets.only(top: 100),
        child: Column(
          children: [
            const Text(
              'Formas de pagamento',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 20,
            ),
            Observer(builder: (_) {
              return SizedBox(
                width: screen.width * 0.4,
                height: screen.height * _sizeHeight(),
                child: Observer(builder: (_) {
                  return const ListViewCard();
                })
              );
            }),
            SizedBox(
              height: screen.height * 0.02,
            ),
            Observer(builder: (_) {
              return ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: secondaryColor,
                    fixedSize: Size(screen.width * 0.3, 50),
                  ),
                  onPressed: () {
                    print('Adicionar rota para o form de cadastro de cartão');
                  },
                  child: const Text('Adicionar forma de pagamento'));
            }),
          ],
        ),
      ),
    ));
  }
}