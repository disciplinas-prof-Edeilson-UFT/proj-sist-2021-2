import 'package:flutter/material.dart';
import 'cupom_selector.dart';

class DesktopCupom extends StatelessWidget {
  const DesktopCupom({Key? key}) : super(key: key);

  final _cupomTextStyle = const TextStyle(
    color: Color(0xFF2e6788),
    fontSize: 13,
    fontFamily: 'Nunito',
  );

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: CupomSelector(
                cupom: Card(
                  color: Colors.white,
                  child: Center(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                        color: const Color(0xffEFF3F5),
                      ),
                      height: 50,
                      width: 250,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 8, left: 20),
                            child: Image.asset(
                              'lib/app/modules/home/assets/images/entrega_gratis.png',
                              height: 30,
                              color: const Color(0xFF2e6788),
                            ),
                          ),
                          Expanded(
                            child: Text(
                              'Entrega grátis disponível',
                              style: _cupomTextStyle,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                cardName: 'entrega_gratis',
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: CupomSelector(
                cupom: Card(
                  color: Colors.white,
                  child: Center(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                        color: const Color(0xffEFF3F5),
                      ),
                      height: 50,
                      width: 250,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 8, left: 20),
                            child: Image.asset(
                              'lib/app/modules/home/assets/images/cupom.png',
                              height: 30,
                              color: const Color(0xFF2e6788),
                            ),
                          ),
                          Expanded(
                            child: Text(
                              'Desconto de R\$ disponível',
                              style: _cupomTextStyle,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                cardName: 'desconto',
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: CupomSelector(
                cupom: Card(
                  color: Colors.white,
                  child: Center(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                        color: const Color(0xffEFF3F5),
                      ),
                      height: 50,
                      width: 250,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 12, left: 25),
                            child: Image.asset(
                              '../assets/images/cupons/coupon.png',
                              height: 20,
                              color: const Color(0xFF2e6788),
                            ),
                          ),
                          Expanded(
                            child: Text(
                              'Não desejo fornecer cupons',
                              style: _cupomTextStyle,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                cardName: 'nenhum',
              ),
            ),
          ],
        )
      ],
    );
  }
}
