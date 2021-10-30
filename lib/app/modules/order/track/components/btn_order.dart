import 'package:flutter/material.dart';
import 'package:pscomidas/app/modules/home/schemas.dart';

class BtnOrder extends StatelessWidget {
  final String name;
  const BtnOrder({ Key? key, required this.name }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size screen = MediaQuery.of(context).size;

    return TextButton(
      style: TextButton.styleFrom(
        primary: secondaryCollor,
      ),
      onPressed: () => print('Adicionar a navegação para a pagina de acompanhamento'),
      child: Text(
        name,
        style: const TextStyle(
          fontFamily: 'Nunito',
          fontSize: 15,
          fontWeight: FontWeight.bold
        ),
      ),
    );
  }
}
