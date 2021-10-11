import 'package:flutter/material.dart';

class ButtonCard extends StatelessWidget {
  final GestureTapCallback onPressed;
  final String namebutton;
  final String type;
  ButtonCard({
    required this.onPressed,
    required this.namebutton,
    required this.type,
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
          children: [const Icon(Icons.credit_card), Text(namebutton)],
        ),
      ),
      onPressed: onPressed,
    );
  }
}
