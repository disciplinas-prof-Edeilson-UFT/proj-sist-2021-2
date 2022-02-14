import 'package:another_flushbar/flushbar.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:pscomidas/app/modules/client_address/client_address_store.dart';
import 'package:pscomidas/app/modules/client_address/pages/pick_address.dart';
import 'package:pscomidas/app/modules/client_address/pages/saved_addresses.dart';
import 'package:pscomidas/app/modules/client_address/pages/search_address.dart';

import 'pages/address_number.dart';

class ClientAddressPage extends StatefulWidget {
  final String title;
  const ClientAddressPage({Key? key, this.title = 'ClientAddressPage'})
      : super(key: key);
  @override
  ClientAddressPageState createState() => ClientAddressPageState();
}

class ClientAddressPageState extends State<ClientAddressPage> {
  final ClientAddressStore store = Modular.get();
  List<ReactionDisposer> disposers = [];

  @override
  void initState() {
    disposers = [
      reaction(
        (_) => store.errorMessage != null,
        (_) => Flushbar(
          title: 'Ocorreu um erro ao tentar fazer login:',
          icon: const Icon(
            Icons.sentiment_dissatisfied_outlined,
            color: Colors.white70,
          ),
          message: store.errorMessage,
          backgroundColor: Colors.red,
          borderRadius: BorderRadius.circular(10.0),
          padding: const EdgeInsets.all(20.0),
          margin: const EdgeInsets.symmetric(horizontal: 100.0, vertical: 10.0),
          animationDuration: const Duration(milliseconds: 500),
          shouldIconPulse: false,
          mainButton: TextButton(
            child: const Text(
              'Fechar',
              style: TextStyle(color: Colors.white),
            ),
            onPressed: () {
              store.errorMessage = null;
              Navigator.pop(context);
            },
          ),
        ).show(context),
      ),
    ];
    store.fetchSavedAddresses();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size screen = MediaQuery.of(context).size;
    return AlertDialog(
      content: SizedBox(
        width: screen.width * .4,
        height: screen.height * .5,
        child: PageView(
          physics: const NeverScrollableScrollPhysics(),
          controller: store.pageController,
          children: const [
            SavedAdresses(),
            SearchAddress(),
            PickAddress(),
            AddressNumber(),
          ],
        ),
      ),
    );
  }
}
