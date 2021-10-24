import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class EnderecoEntrega extends StatelessWidget {
  const EnderecoEntrega({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(
          Icons.map_outlined,
          size: 40,
        ),
        Column(children: const <Widget>[
          AutoSizeText(
            'Rua Fabiano Cambota 258',
            presetFontSizes: [16, 14, 10],
            style: TextStyle(
              fontFamily: 'Nunito',
            ),
          ),
          AutoSizeText(
            'Ponta grossa/PR',
            presetFontSizes: [16, 14, 10],
            style: TextStyle(
              fontFamily: 'Nunito',
            ),
          ),
        ]),
        const VerticalDivider(
          thickness: 4,
          color: Colors.transparent,
        ),
        const InkWell(
          child: Text('Trocar',
              style: TextStyle(
                color: Colors.red,
              )),
        ),
      ],
    );
  }
}
