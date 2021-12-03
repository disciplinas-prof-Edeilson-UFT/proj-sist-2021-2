import 'package:flutter/material.dart';
import 'cupom_selector.dart';

class MobilePlan extends StatelessWidget {
  const MobilePlan({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Column(
            children: [
              CupomSelector(
                cupom: const Card(
                  color: Colors.white,
                  child: Text('suco1'),
                ),
                cardName: 'entrega_gratis',
              ),
              Padding(
                padding: const EdgeInsets.only(top: 24, bottom: 16),
                child: CupomSelector(
                  cupom: const Card(
                    color: Colors.white,
                    child: Text('suco1'),
                  ),
                  cardName: 'desconto',
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
