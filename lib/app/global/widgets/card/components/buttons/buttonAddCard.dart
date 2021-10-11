// ignore_for_file: file_names

import 'package:flutter/material.dart';

class ButtonAddCard extends StatelessWidget {
  final GestureTapCallback onPressed;
  // ignore: non_constant_identifier_names
  final String name_button;
  ButtonAddCard({
    required this.onPressed,
    // ignore: non_constant_identifier_names
    required this.name_button,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
          primary: Colors.black,
          backgroundColor: Colors.white,
          onSurface: Colors.red),
      child: Container(
        width: 200,
        height: 50,
        padding: const EdgeInsets.only(left: 20, right: 100),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: const BorderRadius.all(Radius.circular(5)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [const Icon(Icons.credit_card), Text(name_button)],
        ),
      ),
      onPressed: onPressed,
    );
  }
}
