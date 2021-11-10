import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';
import 'package:pscomidas/app/modules/client_address/client_address_store.dart';

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
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: const <Widget>[],
      ),
    );
  }
}
