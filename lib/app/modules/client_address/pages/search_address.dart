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
    return Container(
      decoration: const BoxDecoration(color: Colors.red),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          IconButton(
            onPressed: store.previous,
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
            ),
          ),
          Expanded(child: TextField(
            onChanged: (velor) {
              store.enterText = velor;
            },
          )),
          IconButton(
            onPressed: () async {
              await store.fechPlace();
            },
            icon: const Icon(
              Icons.keyboard_arrow_right,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
