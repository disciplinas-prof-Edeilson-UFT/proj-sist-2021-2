import 'package:flutter/material.dart';

class TBnTO extends StatelessWidget {
  final String name;
  const TBnTO({Key? key, required this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        primary: Colors.red,
      ),
      child: Text(
        name,
        style: const TextStyle(
            fontFamily: 'Nunito', fontSize: 15, fontWeight: FontWeight.bold),
      ),
      onPressed: () => {},
    );
  }
}
