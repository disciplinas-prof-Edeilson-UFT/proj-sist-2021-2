import 'package:flutter/material.dart';
import 'package:pscomidas/app/global/utils/schemas.dart';

class BtnEdit extends StatefulWidget {
  const BtnEdit({ Key? key }) : super(key: key);

  @override
  _BtnEditState createState() => _BtnEditState();
}

class _BtnEditState extends State<BtnEdit> {
  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () => showDialog<String>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: const Text(
            'Como quer chamar o cartão?', 
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold
            ),
          ),
          content: const TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder()
            ),
          ),
          actions: [
            Center(
              child: Column(
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      fixedSize: Size(250, 40),
                      primary: secondaryColor
                    ),
                    onPressed: () => Navigator.pop(context),
                    child: const Text('Salvar apelido'),
                  ),
                  const SizedBox(height: 10,),
                  TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text(
                      'Cancelar', 
                      style: TextStyle(color: secondaryColor),
                    ),
                  ),
                ]
              ),
            )
            
          ],
        ),
      ),
      tooltip: 'Editar',
      icon: const Icon(Icons.edit, color: secondaryColor,)
    );
  }
}