import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';

import 'update_client_data_store.dart';

class ChangeClientDataPage extends StatefulWidget {
  final String title;
  const ChangeClientDataPage({Key? key, this.title = 'ChangeClientDataPage'})
      : super(key: key);
  @override
  ChangeClientDataPageState createState() => ChangeClientDataPageState();
}

class ChangeClientDataPageState extends State<ChangeClientDataPage> {
  final ChangeClientDataStore store = Modular.get();

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
