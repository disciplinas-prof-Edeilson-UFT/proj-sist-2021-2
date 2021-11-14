import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:pscomidas/app/modules/client_address/client_address_store.dart';
import 'package:pscomidas/app/modules/home/schemas.dart';

class AddressListTile extends StatefulWidget {
  const AddressListTile({
    Key? key,
    this.title,
    this.subtitle,
    this.onPressed,
  }) : super(key: key);

  final String? title;
  final String? subtitle;
  final Function()? onPressed;

  @override
  _AddressListTileState createState() => _AddressListTileState();
}

class _AddressListTileState extends State<AddressListTile> {
  final ClientAddressStore store = Modular.get();

  @override
  Widget build(BuildContext context) {
    return Slidable(
      startActionPane: ActionPane(
        openThreshold: 0.1,
        closeThreshold: 0.4,
        extentRatio: 0.3,
        motion: const ScrollMotion(),
        children: [
          SlidableAction(
            icon: Icons.edit,
            backgroundColor: Colors.transparent,
            foregroundColor: secondaryCollor,
            onPressed: (context) {},
          ),
          SlidableAction(
            icon: Icons.delete,
            backgroundColor: Colors.transparent,
            foregroundColor: secondaryCollor,
            onPressed: (context) {},
          ),
        ],
      ),
      child: const MyHouse(),
    );
  }
}

class MyHouse extends StatefulWidget {
  const MyHouse({
    Key? key,
  }) : super(key: key);

  @override
  _MyHouseState createState() => _MyHouseState();
}

class _MyHouseState extends State<MyHouse> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      tileColor: Colors.transparent,
      title: const Text('Casa'),
      subtitle: const Text("Q. 208 Sul, Alameda 10, 202"),
      leading: const Icon(
        Icons.house,
      ),
      trailing: IconButton(
        icon: const Icon(
          Icons.more_vert,
          color: tertiaryCollor,
        ),
        onPressed: () {
          Slidable.of(context)?.openStartActionPane();
        },
      ),
      onTap: () {
        Slidable.of(context)?.close();
      },
    );
  }
}
