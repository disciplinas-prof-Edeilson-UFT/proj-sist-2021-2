import 'package:flutter/material.dart';

class RegisterSideText extends StatelessWidget {
  const RegisterSideText({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 60.0),
      child: SizedBox(
        width: 400,
        height: 530,
        child: Column(
          children: [
            Text(
              'Conquiste mais clientes em Palmas',
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
            Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: Text(
                'Cadastre-se agora para expandir seu negócio com o PSfood',
                textAlign: TextAlign.left,
                style: const TextStyle(
                  color: Colors.grey,
                  fontSize: 20,
                  fontFamily: 'Nunito',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
