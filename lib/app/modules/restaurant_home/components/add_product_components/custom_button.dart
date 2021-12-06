import 'package:flutter/material.dart';
import 'package:pscomidas/app/global/utils/schemas.dart';

class CustomButton extends StatelessWidget {
  final String label;
  final Function()? onPressed;
  const CustomButton({
    Key? key,
    required this.onPressed,
    required this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: ElevatedButton(
        child: Text(label,
            style: const TextStyle(
              color: primaryColor,
              fontWeight: FontWeight.w500,
            )),
        style: ElevatedButton.styleFrom(primary: secondaryColor),
        onPressed: onPressed,
      ),
    );
  }
}
