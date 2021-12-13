import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';
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

  @override
  void initState() {
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
