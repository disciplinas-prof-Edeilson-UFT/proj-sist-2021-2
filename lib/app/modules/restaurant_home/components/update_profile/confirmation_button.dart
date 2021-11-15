import 'package:flutter/material.dart';
import 'package:pscomidas/app/global/utils/schemas.dart';

class ConfirmationButton extends StatefulWidget {
  const ConfirmationButton({Key? key}) : super(key: key);

  @override
  _ConfirmationButtonState createState() => _ConfirmationButtonState();
}

class _ConfirmationButtonState extends State<ConfirmationButton> {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: TextButton(
          child: const Text(
            'Confirmar cadastro',
            style: TextStyle(
              fontFamily: 'Nunito',
              fontSize: 18,
              color: Colors.white,
            ),
          ),
          style: ButtonStyle(
            elevation: MaterialStateProperty.all(4),
            minimumSize: MaterialStateProperty.all(const Size(210, 48)),
            backgroundColor: MaterialStateProperty.all(secondaryColor),
          ),
          onPressed: () {}),
    );
  }
}
