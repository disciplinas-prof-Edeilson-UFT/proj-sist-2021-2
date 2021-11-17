import 'package:flutter/material.dart';

class StoreName extends StatelessWidget {
  final String storeName;
  const StoreName({
    Key? key,
    required this.storeName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent, //altere a cor pra ver melhor
      child: Text(
        storeName,
        style: const TextStyle(
          fontSize: 30.0,
          //fontStyle: FontStyle.normal,
        ),
      ),
    );
  }
}
