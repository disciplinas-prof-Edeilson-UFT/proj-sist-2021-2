import 'package:flutter/material.dart';

class CardOrder extends StatelessWidget {
  const CardOrder({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Card(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Nome do Entregador'),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(10)
                    ),
                    padding: EdgeInsets.all(10),
                    child: Text('Pendente'),
                  )
                ],
              ),
            )
          ],
        ),
      ),
      onTap: (){}, // adiciona rota aqui
    );
  }
}