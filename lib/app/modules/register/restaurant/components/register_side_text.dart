import 'package:flutter/material.dart';

class RegisterSideText extends StatelessWidget {
  const RegisterSideText({
    Key? key,
  }) : super(key: key);
  final String _city = "Palmas";

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 400,
      child: Column(
        children: [
          Text(
            'Conquiste mais clientes em $_city',
            softWrap: true,
            maxLines: 3,
            textAlign: TextAlign.left,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              color: Colors.grey[800],
              fontSize: 60,
              fontWeight: FontWeight.bold,
              fontFamily: 'Nunito',
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 16.0),
            child: Text(
              'Cadastre-se agora para expandir seu negócio com o PSfood',
              textAlign: TextAlign.left,
              style: TextStyle(
                color: Colors.grey,
                fontSize: 20,
                fontFamily: 'Nunito',
              ),
            ),
          ),
        ],
      ),
    );
  }
}
