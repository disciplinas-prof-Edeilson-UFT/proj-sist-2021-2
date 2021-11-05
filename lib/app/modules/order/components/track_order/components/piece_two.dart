import 'package:flutter/material.dart';

class PieceTwoTO extends StatelessWidget {
  const PieceTwoTO({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size screen = MediaQuery.of(context).size;
    return Container(
      color: Colors.green,
      padding: const EdgeInsets.all(3),
      width: screen.width * 0.25,
      height: screen.height * 0.60,
      child: Column(
        children: [
          Container(
            color: Colors.white,
            child: Text(
              'Acompanhe seu pedido',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
