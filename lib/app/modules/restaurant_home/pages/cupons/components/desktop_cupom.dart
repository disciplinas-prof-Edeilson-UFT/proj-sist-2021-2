import 'package:flutter/material.dart';
import 'cupom_selector.dart';

class DesktopCupom extends StatelessWidget {
  const DesktopCupom({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 8.0),
          child: CupomSelector(
            cupom: Card(
              color: Colors.white,
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: Container(
                        child: Column(
                          children: [
                            const Align(
                              alignment: Alignment.topCenter,
                              child: Text(
                                "Nenhum cupom!",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  overflow: TextOverflow.clip,
                                  fontFamily: 'Nunito',
                                  color: Colors.black,
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment.center,
                              child: Image.asset(
                                  '../assets/images/cupons/cupom.png',
                                  width: 40,
                                  height: 40,
                                  color: Colors.black),
                            ),
                          ],
                        ),
                        decoration: BoxDecoration(
                          color: Colors.cyan[50],
                          borderRadius: BorderRadius.circular(8),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              blurRadius: 6.0, // soften the shadow
                              spreadRadius: 2.0, //extend the shadow
                              offset: const Offset(0, 3),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            cardName: 'nenhum',
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 8.0),
          child: CupomSelector(
            cupom: const Card(
              color: Colors.white,
              child: Text('suco2'),
            ),
            cardName: 'desconto',
          ),
        ),
        CupomSelector(
          cupom: const Card(
            color: Colors.white,
            child: Text('suco3'),
          ),
          cardName: 'entrega_gratis',
        ),
      ],
    );
  }
}
