import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pscomidas/app/global/utils/schemas.dart';
import 'package:pscomidas/app/modules/restaurant_home/components/update_sensitive_data/management_dialog.dart';
import 'package:pscomidas/app/modules/restaurant_home/restaurant_home_store.dart';

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

class NextIcon extends StatelessWidget {
  NextIcon({Key? key}) : super(key: key);

  final RestaurantHomeStore restaurantHomeStore =
      Modular.get<RestaurantHomeStore>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 5),
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: GestureDetector(
          onTap: () {
            Navigator.of(context).pop();
            showDialog(
                context: context,
                builder: (_) {
                  restaurantHomeStore.updateManagementControllers();
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
