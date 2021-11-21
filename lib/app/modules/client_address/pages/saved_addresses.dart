import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pscomidas/app/modules/client_address/client_address_store.dart';
import 'package:pscomidas/app/modules/client_address/widgets/address_list_tile.dart';
import 'package:pscomidas/app/modules/home/schemas.dart';

class SavedAdresses extends StatefulWidget {
  const SavedAdresses({Key? key}) : super(key: key);

  @override
  _SavedAdressesState createState() => _SavedAdressesState();
}

class _SavedAdressesState extends State<SavedAdresses> {
  final ClientAddressStore store = Modular.get();

  List test = List.generate(3, (index) => 1);

  @override
  Widget build(BuildContext context) {
    Size screen = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            height: screen.height * .3,
            width: screen.width * .3,
            decoration: const BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.contain,
                image: NetworkImage('https://i.imgur.com/50wsQ3L.jpg'),
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
          fakeSearch(),
          const SizedBox(
            height: 10,
          ),
          ListView.builder(
            itemBuilder: (context, index) {
              return const AddressListTile();
            },
            shrinkWrap: true,
            itemCount: test.length,
          ),
        ],
      ),
    );
  }

  Widget fakeSearch() {
    return Container(
      height: 55,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        border: Border.all(color: tertiaryCollor),
        borderRadius: BorderRadius.circular(6),
      ),
      child: ListTile(
        title: const Text(
          'Busque endereço e número',
          style: TextStyle(
            color: tertiaryCollor,
            fontSize: 16,
          ),
        ),
        leading: const Icon(
          Icons.search,
          color: secondaryCollor,
        ),
        onTap: () => store.jump(1),
      ),
    );
  }
}
