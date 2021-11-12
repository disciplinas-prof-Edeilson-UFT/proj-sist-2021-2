import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';

import 'update_client_data_store.dart';

class UpdateClientDataPage extends StatefulWidget {
  final String title;
  const UpdateClientDataPage({Key? key, this.title = 'UpdateClientDataPage'})
      : super(key: key);
  @override
  UpdateClientDataPageState createState() => UpdateClientDataPageState();
}

class UpdateClientDataPageState extends State<UpdateClientDataPage> {
  final UpdateClientDataStore store = Modular.get();

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
