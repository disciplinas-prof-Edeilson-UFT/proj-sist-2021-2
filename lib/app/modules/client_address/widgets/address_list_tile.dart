import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:mobx/mobx.dart';
import 'package:pscomidas/app/modules/client_address/client_address_store.dart';
import 'package:pscomidas/app/modules/home/schemas.dart';

class AddressListTile extends StatefulWidget {
  const AddressListTile({
    Key? key,
  }) : super(key: key);

  @override
  _AddressListTileState createState() => _AddressListTileState();
}

@observable
class _AddressListTileState extends State<AddressListTile> {
  final ClientAddressStore store = Modular.get();

  @override
  Widget build(BuildContext context) {
    return Slidable(
      enabled: true,
      startActionPane: ActionPane(
        extentRatio: 0.2,
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
      child: MyHouse(
        trailing: true,
        onPressed: () => Slidable.of(context)?.openStartActionPane(),
        onTap: () => Slidable.of(context)?.close(),
      ),
    );
  }
}

class MyHouse extends StatefulWidget {
  const MyHouse({
    Key? key,
    this.title,
    this.subtitle,
    this.onTap,
    this.onPressed,
    this.trailing = false,
  }) : super(key: key);

  final String? title;
  final String? subtitle;
  final Function()? onTap;
  final Function()? onPressed;
  final bool trailing;

  @override
  _MyHouseState createState() => _MyHouseState();
}

class _MyHouseState extends State<MyHouse> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          tileColor: Colors.transparent,
          title: const Text('Casa'),
          subtitle: const Text("Q. 208 Sul, Alameda 10, 202"),
          leading: const Icon(
            Icons.house,
          ),
          trailing: widget.trailing
              ? IconButton(
                  icon: const Icon(
                    Icons.more_vert,
                    color: tertiaryCollor,
                  ),
                  onPressed: widget.onPressed,
                )
              : null,
          onTap: widget.onTap,
        ),
      ],
    );
  }
}
