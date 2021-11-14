import 'package:flutter/material.dart';
import 'package:pscomidas/app/global/utils/schemas.dart';

class UpdateProfileConfirmationButton extends StatefulWidget {
  const UpdateProfileConfirmationButton({Key? key}) : super(key: key);

  @override
  _UpdateProfileConfirmationButtonState createState() =>
      _UpdateProfileConfirmationButtonState();
}

class _UpdateProfileConfirmationButtonState
    extends State<UpdateProfileConfirmationButton> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        bottom: 40.0,
      ),
      child: Align(
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
      ),
    );
  }
}
