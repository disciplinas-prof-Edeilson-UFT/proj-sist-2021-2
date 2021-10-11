import 'package:flutter/material.dart';

class ButtonBuilder extends StatefulWidget {
  const ButtonBuilder({Key? key}) : super(key: key);

  @override
  _ButtonBuilderState createState() => _ButtonBuilderState();
}

class _ButtonBuilderState extends State<ButtonBuilder> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.2,
      child: ElevatedButton(
        onPressed: () => null,
        child: const Text(
          'Escolher forma de pagamento',
          style: TextStyle(
            fontSize: 18,
          ),
        ),
        style: ElevatedButton.styleFrom(
          primary: Colors.red,
          shadowColor: Colors.black26,
          padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
        ),
      ),
    );
  }
}
