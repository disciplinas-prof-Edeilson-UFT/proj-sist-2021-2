import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class PrevEntrega extends StatelessWidget {
  const PrevEntrega({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        child: Column(
      children: <Widget>[
        const AutoSizeText(
          'Hoje, 30 ~ 45 min',
          wrapWords: false,
          presetFontSizes: [16, 14, 10],
        ),
        Container(
          padding: const EdgeInsets.all(5),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              border: Border.all(
                color: Colors.red,
                width: 1,
              )),
          child: Column(
            children: const <Widget>[
              AutoSizeText(
                'Padrão',
                textAlign: TextAlign.start,
              ),
              AutoSizeText(
                'Hoje, 30 ~ 45 min',
                textAlign: TextAlign.left,
              ),
              AutoSizeText(
                'R\$ 12,50',
                textAlign: TextAlign.left,
              ),
            ],
          ),
        ),
      ],
    ));
  }
}
