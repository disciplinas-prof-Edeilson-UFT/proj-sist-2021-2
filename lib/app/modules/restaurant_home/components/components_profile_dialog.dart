import 'package:flutter/material.dart';
import 'package:pscomidas/app/global/utils/schemas.dart';
import 'package:pscomidas/app/modules/restaurant_home/components/update_adress/adress_dialog.dart';
import 'package:pscomidas/app/modules/restaurant_home/components/update_profile/profile_alert_dialog.dart';
import 'package:pscomidas/app/modules/restaurant_home/components/update_sensitive_data/management_dialog.dart';

class ConfirmationButton extends StatelessWidget {
  const ConfirmationButton({
    Key? key,
    required this.onPressed,
  }) : super(key: key);

  final void Function() onPressed;

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
        onPressed: onPressed,
      ),
    );
  }
}

class NextIcon extends StatefulWidget {
  const NextIcon(
      {Key? key, required this.currentState, required this.direction})
      : super(key: key);
  final String currentState;
  final String direction;
  @override
  _NextIconState createState() => _NextIconState();
}

class _NextIconState extends State<NextIcon> {
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
          onTap: () {
            if (widget.direction == 'Proximo') {
              widget.currentState == 'Profile' ?
                  DefaultTabController.of(context)!.animateTo(1)
                  : DefaultTabController.of(context)!.animateTo(2);
            } else if (widget.direction == 'Anterior') {
              widget.currentState == 'Gerenciamento'
                  ? DefaultTabController.of(context)!.animateTo(0)
                  : DefaultTabController.of(context)!.animateTo(1);
            }
          },
          child: widget.direction == 'Proximo'
              ? const Icon(
                  Icons.arrow_forward_ios_outlined,
                  color: secondaryColor,
                  size: 39,
                )
              : const Icon(
                  Icons.arrow_back_ios_outlined,
                  color: secondaryColor,
                  size: 39,
                )),
    );
  }
}
