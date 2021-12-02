import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:pscomidas/app/global/utils/schemas.dart';
import 'package:pscomidas/app/modules/payments/components/cards_payments/btn_edit.dart';
import 'package:pscomidas/app/modules/payments/components/cards_payments/btn_excluir.dart';

class ListViewCard extends StatelessWidget {
  const ListViewCard({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Função para pegar apenas os quatros ultimos numeros do cartão
    String getLastChars(String numero) {
      var tamanho = numero.length;
      var start = tamanho == 16 ? 12 : 10;
      var end = tamanho;
      var lastChars = numero.substring(start, end);
      return lastChars;
    }

    final Size screen = MediaQuery.of(context).size;

    return Observer(builder: (_) {
      return ListView.builder(
        itemCount: 1, // numero de cartões cadastrados
        itemBuilder: (_, index) {
          return Container(
            height: 100,
            child: Card(
              child: InkWell(
                splashColor: Colors.red.withAlpha(30),
                onTap: () => null,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          const Icon(Icons.credit_card, color: secondaryColor, size: 30,),
                          SizedBox(width: screen.width * 0.02,),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Cartão',
                                style: TextStyle(
                                  fontFamily: 'Nunito',
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold
                                ),
                              ),
                              Text(
                                '... ${getLastChars('1234567812345678')}',
                                style: const TextStyle(
                                  fontFamily: 'Nunito',
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      
                        Row(
                          children: const[
                            BtnEdit(),
                            BtnExcluir()
                          ],
                        ),
                      
                    ],
                  ),
                ),
              )
            ),
          );
        }
      );
    });
  }
}
