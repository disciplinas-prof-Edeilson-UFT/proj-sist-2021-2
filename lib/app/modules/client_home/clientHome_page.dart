import 'package:flutter_modular/flutter_modular.dart';
import 'package:pscomidas/app/modules/client_home/clientHome_store.dart';
import 'package:flutter/material.dart';

class ClientHomePage extends StatefulWidget {
  final String title;
  const ClientHomePage({Key? key, this.title = 'ClientHomePage'}) : super(key: key);
  @override
  ClientHomePageState createState() => ClientHomePageState();
}
class ClientHomePageState extends State<ClientHomePage> {
  final ClientHomeStore store = Modular.get();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: <Widget>[],
      ),
    );
  }
}