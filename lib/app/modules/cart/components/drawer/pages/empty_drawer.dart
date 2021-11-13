import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:pscomidas/app/global/utils/schemas.dart';

class EmptyDrawer extends StatelessWidget {
  final double width;
  const EmptyDrawer({Key? key, required this.width}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: ListTile(
        title: AutoSizeText(
          'Você não tem itens',
          textAlign: TextAlign.center,
          presetFontSizes: [18, 16, 10],
          wrapWords: true,
          style: TextStyle(
            color: Colors.black,
            fontFamily: 'Nunito',
            fontWeight: FontWeight.w800,
          ),
        ),
        subtitle: AutoSizeText(
          'Adicione um item para continuar',
          textAlign: TextAlign.center,
          presetFontSizes: [14, 12, 10],
          wrapWords: true,
          style: TextStyle(
            color: secondaryColor,
            fontFamily: 'Nunito',
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
