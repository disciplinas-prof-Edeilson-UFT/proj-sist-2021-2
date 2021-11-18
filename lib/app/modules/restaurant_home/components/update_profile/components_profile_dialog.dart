import 'package:flutter/material.dart';
import 'package:pscomidas/app/global/utils/schemas.dart';
import 'package:pscomidas/app/modules/restaurant_home/components/update_profile/management_dialog.dart';

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
  const NextIcon({Key? key}) : super(key: key);

  @override
  _NextIconState createState() => _NextIconState();
}

class _NextIconState extends State<NextIcon> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 0.2),
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: GestureDetector(
          onTap: () {
            Navigator.of(context).pop();
            showDialog(
                context: context,
                builder: (_) {
                  return const ManagementDialog();
                });
          },
          child: const Icon(
            Icons.arrow_forward_ios_outlined,
            color: secondaryColor,
            size: 50,
          ),
        ),
      ),
    );
  }
}
