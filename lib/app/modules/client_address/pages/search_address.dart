import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pscomidas/app/global/models/entities/delivery_at.dart';
import 'package:pscomidas/app/global/utils/schemas.dart';
import 'package:pscomidas/app/modules/client_address/client_address_store.dart';
import 'package:pscomidas/app/modules/client_address/widgets/address_list_tile.dart';
import 'package:pscomidas/app/modules/client_address/widgets/search_textfield.dart';

class SearchAddress extends StatefulWidget {
  const SearchAddress({Key? key}) : super(key: key);

  @override
  _SearchAddressState createState() => _SearchAddressState();
}

class _SearchAddressState extends State<SearchAddress> {
  final ClientAddressStore store = Modular.get();

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
          Observer(builder: (_) {
            if (!store.addresses.isCompleted || store.addresses.body == null) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  if (store.addresses.hasError ||
                      store.addresses.body == null) ...[
                    const Icon(
                      Icons.error_outline_sharp,
                      color: secondaryColor,
                    )
                  ] else ...[
                    const CircularProgressIndicator(color: secondaryColor),
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
          ListTile(
            onTap: () => store.jump(2),
            leading: const Icon(Icons.map),
            title: const Text(
              "Não achei meu endereço",
              style: TextStyle(
                color: secondaryColor,
              ),
            ),
            subtitle: const Text("Buscar pelo mapa"),
          ),
        ],
      ),
    );
  }
}
