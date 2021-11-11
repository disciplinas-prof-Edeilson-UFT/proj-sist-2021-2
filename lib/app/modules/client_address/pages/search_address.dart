import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pscomidas/app/modules/client_address/client_address_store.dart';

class SearchAddress extends StatefulWidget {
  const SearchAddress({Key? key}) : super(key: key);

  @override
  _SearchAddressState createState() => _SearchAddressState();
}

class _SearchAddressState extends State<SearchAddress> {
  final ClientAddressStore store = Modular.get();
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: store.next,
      child: Container(
        width: 300,
        height: 300,
        decoration: const BoxDecoration(color: Colors.red),
      ),
    );
  }
}
