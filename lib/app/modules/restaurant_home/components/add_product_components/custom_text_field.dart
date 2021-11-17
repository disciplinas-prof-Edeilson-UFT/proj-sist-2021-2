import 'package:flutter/material.dart';
import 'package:pscomidas/app/global/utils/schemas.dart';

class CustomTextField extends StatelessWidget {
  final String? label;

  const CustomTextField({
    Key? key,
    required this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        width: 500,
        child: TextFormField(
          cursorColor: secondaryColor,
          enabled: true,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 18,
            fontFamily: 'Nunito',
          ),
          decoration: InputDecoration(
            border: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.red),
                borderRadius: BorderRadius.circular(5.0)),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: secondaryColor),
              borderRadius: BorderRadius.circular(5.0),
            ),
            hintText: label,
            hintStyle: const TextStyle(
              fontFamily: 'Nunito',
              fontSize: 14,
              color: Colors.black,
              fontWeight: FontWeight.w300,
            ),
          ),
        ),
      ),
    );
  }
}
