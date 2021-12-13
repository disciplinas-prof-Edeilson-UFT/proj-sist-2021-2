import 'package:flutter/material.dart';
import 'cupom_card.dart';

class CupomMobileLayout extends StatelessWidget {
  const CupomMobileLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: CupomCard(
                  name: 'entrega_gratis',
                  text: 'Entrega grátis disponível',
                  image: '../assets/images/cupons/entrega_gratis.png',
                  descr:
                      'Ao escolher esta opção, forneça a alguns de seus clientes mais fiéis um cupom de entrega grátis!',
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: CupomCard(
                  name: 'desconto',
                  text: 'Desconto de R\$ disponível',
                  image: '../assets/images/cupons/desconto.png',
                  descr:
                      'Ao escolher esta opção, forneça a alguns de seus clientes mais fiéis um desconto no valor que você decidir!',
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: CupomCard(
                  name: 'nenhum',
                  text: 'Sem cupons',
                  image: '../assets/images/cupons/cupom.png',
                  descr:
                      'Não fornecer cupons. Lembrando que fornecer cupons pode atrair mais clientes a sua loja!',
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
