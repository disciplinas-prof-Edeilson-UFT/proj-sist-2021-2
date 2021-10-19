// ignore_for_file: avoid_unnecessary_containers

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class PaymentMethod extends StatelessWidget {
  const PaymentMethod({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ElevatedButton(
          onPressed: () => {},
          style: ElevatedButton.styleFrom(primary: Colors.white),
          child: const ListTile(
            leading: Icon(Icons.qr_code),
            title: AutoSizeText('Pague por Pix',
                wrapWords: true,
                style: TextStyle(
                    fontFamily: 'Ninuto', fontWeight: FontWeight.w500)),
            subtitle: AutoSizeText(
                'Use o leitor de QR ou copie e cole o código',
                presetFontSizes: [18, 14, 8],
                style: TextStyle(
                    fontFamily: 'Ninuto', fontWeight: FontWeight.w500)),
          ),
        ),
        const Divider(thickness: 5, color: Colors.transparent),
        Container(
            child: ElevatedButton(
          onPressed: () => {},
          style: ElevatedButton.styleFrom(
            primary: Colors.white,
          ),
          child: const ListTile(
            leading: Icon(Icons.credit_card_outlined),
            title: AutoSizeText('Adicione um cartão',
                presetFontSizes: [18, 14],
                wrapWords: false,
                style: TextStyle(
                  fontFamily: 'Ninuto',
                  fontWeight: FontWeight.w500,
                )),
            subtitle:
                AutoSizeText('Nenhum Cartao Cadastrado. Adicione um cartão',
                    presetFontSizes: [16, 12],
                    wrapWords: false,
                    style: TextStyle(
                      fontFamily: 'Ninuto',
                      fontWeight: FontWeight.w500,
                    )),
          ),
        )),
        const Divider(thickness: 5, color: Colors.transparent),
        Container(
            child: ElevatedButton(
          onPressed: () => {},
          style: ElevatedButton.styleFrom(
            primary: Colors.white,
          ),
          child: const ListTile(
            leading: Icon(Icons.payments_outlined),
            title: AutoSizeText('Pague com dinheiro',
                presetFontSizes: [18, 14],
                wrapWords: false,
                style: TextStyle(
                  fontFamily: 'Ninuto',
                  fontWeight: FontWeight.w500,
                )),
            subtitle: AutoSizeText('Pague por dinheiro',
                presetFontSizes: [16, 12],
                wrapWords: false,
                style: TextStyle(
                  fontFamily: 'Ninuto',
                  fontWeight: FontWeight.w500,
                )),
          ),
        )),
      ],
    );
  }
}
