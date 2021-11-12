import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pscomidas/app/modules/client_address/client_address_store.dart';

class PickAddress extends StatefulWidget {
  const PickAddress({Key? key}) : super(key: key);

  @override
  _PickAddressState createState() => _PickAddressState();
}

class _PickAddressState extends State<PickAddress> {
  final ClientAddressStore store = Modular.get();
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: store.previous,
      child: Container(
        width: 300,
        height: 300,
        decoration: const BoxDecoration(color: Colors.amber),
      ),
    );
  }
}
