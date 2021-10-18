import 'package:flutter/material.dart';

class StatusOrder extends StatelessWidget {
  const StatusOrder({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        color: Colors.red,
        width: 500, height: 500,
        child: Text('oi container'),
      ),
    );
  }
}