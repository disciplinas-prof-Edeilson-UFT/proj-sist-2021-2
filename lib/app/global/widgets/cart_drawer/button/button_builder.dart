import 'package:flutter/material.dart';

class ButtonBuilder extends StatefulWidget {
  const ButtonBuilder({Key? key}) : super(key: key);

  @override
  _ButtonBuilderState createState() => _ButtonBuilderState();
}

class _ButtonBuilderState extends State<ButtonBuilder> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.bottomCenter,
      margin: EdgeInsets.only(bottom: 20),
      child: SizedBox(
        height: 40,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(5),
          child: Stack(
            children: <Widget>[
              Positioned.fill(
                child: Container(
                  decoration: const BoxDecoration(color: Colors.red),
                ),
              ),
              TextButton(
                style: TextButton.styleFrom(
                  padding: const EdgeInsets.all(16.0),
                  primary: Colors.white,
                  textStyle: const TextStyle(fontSize: 20),
                ),
                onPressed: (() => {}),
                child: const Text('Pagar'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
