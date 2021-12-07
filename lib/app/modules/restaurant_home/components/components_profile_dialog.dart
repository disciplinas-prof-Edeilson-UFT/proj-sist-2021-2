import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pscomidas/app/global/repositories/update_restaurant_data/update_restaurant_data_repository.dart';
import 'package:pscomidas/app/global/utils/schemas.dart';
import 'package:pscomidas/app/modules/restaurant_home/restaurant_home_store.dart';

class ConfirmationButton extends StatelessWidget {
  ConfirmationButton({
    Key? key,
    required this.onPressed,
  }) : super(key: key);

  final void Function() onPressed;
  final RestaurantHomeStore store = Modular.get<RestaurantHomeStore>();
  final UpdateRestaurantDataRepository repository =
      UpdateRestaurantDataRepository();
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

Future<dynamic> showConfirmationFlush(BuildContext context) {
  return Flushbar(
    message: 'Dados atualizados com sucesso!',
    icon: const Icon(
      Icons.verified,
      color: Colors.white,
    ),
    backgroundColor: Colors.green,
    duration: const Duration(seconds: 3),
    borderRadius: BorderRadius.circular(10.0),
    padding: const EdgeInsets.all(20.0),
    margin: const EdgeInsets.symmetric(
      horizontal: 100.0,
      vertical: 10.0,
    ),
  ).show(context);
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
  RestaurantHomeStore store = Modular.get<RestaurantHomeStore>();
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () {
          if (widget.direction == 'Proximo') {
            widget.currentState == 'Profile'
                ? DefaultTabController.of(context)!.animateTo(1)
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
              ),
      ),
    );
  }
}
