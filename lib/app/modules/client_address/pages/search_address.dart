import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pscomidas/app/modules/client_address/client_address_store.dart';
import 'package:pscomidas/app/modules/client_address/widgets/address_list_tile.dart';
import 'package:pscomidas/app/modules/client_address/widgets/search_textfield.dart';
import 'package:pscomidas/app/modules/home/schemas.dart';

class SearchAddress extends StatefulWidget {
  const SearchAddress({Key? key}) : super(key: key);

  @override
  _SearchAddressState createState() => _SearchAddressState();
}

class _SearchAddressState extends State<SearchAddress> {
  final ClientAddressStore store = Modular.get();

  List test = List.generate(3, (index) => 1);

  @override
  Widget build(BuildContext context) {
    Size screen = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            height: screen.height * .2,
            width: screen.width * .2,
            decoration: const BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.contain,
                image: NetworkImage('https://i.imgur.com/ig0zI1u.jpg'),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              "Onde você quer receber seu pedido?",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w500,
                fontSize: 18,
              ),
            ),
          ),
          SearchTextField(
            controller: store.textController,
            autofocus: true,
            iconswap: true,
            hint: 'Busque endereço e número',
          ),
          const SizedBox(
            height: 10,
          ),
          ListView.builder(
            itemBuilder: (context, index) {
              return AddressListTile(onTap: () => Navigator.pop(context),);
            },
            shrinkWrap: true,
            itemCount: test.length,
          ),
          ListTile(
            onTap: () => store.jump(2),
            leading: const Icon(Icons.map),
            title: const Text(
              "Não achei meu endereço",
              style: TextStyle(
                color: secondaryCollor,
              ),
            ),
            subtitle: const Text("Buscar pelo mapa"),
          ),
        ],
      ),
    );
  }
}
