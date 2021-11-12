import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pscomidas/app/modules/client_address/client_address_store.dart';

class SavedAdresses extends StatefulWidget {
  const SavedAdresses({Key? key}) : super(key: key);

  @override
  _SavedAdressesState createState() => _SavedAdressesState();
}

class _SavedAdressesState extends State<SavedAdresses> {
  final ClientAddressStore store = Modular.get();
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: store.next,
      child: Container(
        decoration: const BoxDecoration(color: Colors.purple),
      ),
    );
  }
}
