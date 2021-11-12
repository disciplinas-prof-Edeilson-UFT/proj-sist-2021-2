import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pscomidas/app/modules/client_address/client_address_store.dart';

class SavedAdresses extends StatefulWidget {
  const SavedAdresses({Key? key}) : super(key: key);

  @override
  _SavedAdressesState createState() => _SavedAdressesState();
}

class _SavedAdressesState extends State<SavedAdresses> {
  final ClientAddressStore store = Modular.get();

  @override
  Widget build(BuildContext context) {
    Size screen = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: store.next,
      child: Column(
        children: [
          Container(
            height: 185.0,
            width: screen.width * .2,
            decoration: const BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage('https://i.imgur.com/50wsQ3L.jpg'),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(10.0),
            child: Text(
              "Onde você quer receber seu pedido?",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w500,
                fontSize: 18,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
