import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';
import 'package:pscomidas/app/modules/client_address/client_address_store.dart';
import 'package:pscomidas/app/modules/client_address/pages/pick_address.dart';
import 'package:pscomidas/app/modules/client_address/pages/search_address.dart';

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
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 1000,
      height: 100,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          PageView(
            controller: store.pageController,
            children: const [
              SearchAddress(),
              PickAddress(),
            ],
          ),
        ],
      ),
    );
  }
}
