import 'package:flutter/material.dart';

class NameStoreTO extends StatelessWidget {
  const NameStoreTO({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent, //altere a cor pra ver melhor
      child: Text(
        'Frutos de Goiás',
        style: TextStyle(
          fontSize: 30.0,
          //fontStyle: FontStyle.normal,
        ),
      ),
    );
  }
}
