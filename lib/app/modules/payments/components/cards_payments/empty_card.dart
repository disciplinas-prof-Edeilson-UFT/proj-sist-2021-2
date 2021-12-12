import 'package:flutter/material.dart';

class EmptyCard extends StatefulWidget {
  const EmptyCard({ Key? key }) : super(key: key);

  @override
  _EmptyCardState createState() => _EmptyCardState();
}

class _EmptyCardState extends State<EmptyCard> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: const[
        //SizedBox(height: 20,),
        Text(
          'Adicione um cartão no PSFood',
          style: TextStyle(
            color: Color(0xff3f3e3e),
            fontFamily: 'Nunito',
            fontSize: 17,
            fontWeight: FontWeight.bold
          ),
        ),
        //SizedBox(height: 20,),
        Text(
          'É prático,  seguro e você não perde\nnenhum minuto a mais quando seu\npedido chegar.',
          style: TextStyle(
            color: Colors.grey,
            fontFamily: 'Nunito',
            fontSize: 17,
          ),
        ),

      ],
    );
  }
}