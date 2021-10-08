import 'package:flutter/material.dart';

Widget ListViewCard(var controller) {
  String getLastChars(String numero) {
    var tamanho = numero.length;
    var start = tamanho == 16 ? 12 : 10;
    var end = tamanho;
    var lastChars = numero.substring(start, end);
    return lastChars;
  }

  return ListView.builder(
    itemCount: controller.listCard.length,
    itemBuilder: (_, index) {
      var card = controller.listCard[index];
      return Card(
        child: InkWell(
        splashColor: Colors.red.withAlpha(30),
        onTap: () {
          print('object');
        },
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(card.apelido),
                  Text(
                    '... ${getLastChars(card.numero_cartao)}',
                    style: TextStyle(color: Colors.grey),
                  ),
                ],
              ),
              IconButton(
                onPressed: (){}, icon: Icon(Icons.delete)
              )
            ],
          ),
        ),
      ));
    }
  );
}