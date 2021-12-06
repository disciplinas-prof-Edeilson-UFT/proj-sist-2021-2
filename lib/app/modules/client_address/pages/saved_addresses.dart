import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pscomidas/app/global/models/entities/delivery_at.dart';
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
  void initState() {
    store.fetchSavedAddresses();
    super.initState();
  }

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
          Observer(builder: (_) {
            if (!store.addresses.isCompleted) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  if (store.addresses.hasError) ...[
                    const Icon(
                      Icons.error_outline_sharp,
                      color: secondaryCollor,
                    )
                  ] else ...[
                    const CircularProgressIndicator(color: secondaryCollor),
                  ],
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      store.addresses.isLoading
                          ? 'Aguarde enquanto organizamos tudo pra você...'
                          : 'Tivemos um probleminha pra encontrar seus endereços.',
                    ),
                  ),
                ],
              );
            }

            return ListView.builder(
              itemBuilder: (context, index) {
                DeliveryAt address = store.addresses.body![index];
                return SlidableAddressTile(address: address);
              },
              shrinkWrap: true,
              itemCount: store.addresses.body!.length,
            );
          }),
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
