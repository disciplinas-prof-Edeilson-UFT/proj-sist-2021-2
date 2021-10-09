// ignore_for_file: file_names

import 'package:flutter/material.dart';

class ButtonCard extends StatelessWidget {
  final GestureTapCallback onPressed;
  final String name_button;
  final String type;
  ButtonCard({required this.onPressed, required this.name_button, required this.type});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        primary: Colors.black,
        backgroundColor: Colors.white,
        onSurface: Colors.red
      ),
      child: Container(
        width: 200, height: 50,
        padding: EdgeInsets.only(left:20, right: 100),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.all(Radius.circular(5)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(Icons.credit_card),
            Text('${name_button}')
          ],
        ),
      ),
      onPressed: onPressed,
    );
  }
}