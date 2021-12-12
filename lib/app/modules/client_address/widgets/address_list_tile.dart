import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:mobx/mobx.dart';
import 'package:pscomidas/app/global/models/entities/delivery_at.dart';
import 'package:pscomidas/app/global/models/enums/address_type.dart';
import 'package:pscomidas/app/global/utils/schemas.dart';
import 'package:pscomidas/app/modules/client_address/client_address_store.dart';

class SlidableAddressTile extends StatefulWidget {
  const SlidableAddressTile({Key? key, this.address}) : super(key: key);
  final DeliveryAt? address;

  @override
  _SlidableAddressTileState createState() => _SlidableAddressTileState();
}

@observable
class _SlidableAddressTileState extends State<SlidableAddressTile> {
  final ClientAddressStore store = Modular.get();

  @override
  Widget build(BuildContext context) {
    return Slidable(
      enabled: true,
      startActionPane: ActionPane(
        extentRatio: 0.15,
        motion: const ScrollMotion(),
        children: [
          SlidableAction(
            icon: Icons.edit,
            backgroundColor: Colors.transparent,
            foregroundColor: secondaryColor,
            onPressed: (context) {},
          ),
          SlidableAction(
            icon: Icons.delete,
            backgroundColor: Colors.transparent,
            foregroundColor: secondaryColor,
            onPressed: (context) {},
          ),
        ],
      ),
      child: AddressListTile(
        trailing: true,
        address: widget.address,
      ),
    );
  }
}

class AddressListTile extends StatefulWidget {
  const AddressListTile({
    Key? key,
    this.onTap,
    this.trailing = false,
    this.address,
  }) : super(key: key);

  final DeliveryAt? address;
  final Function()? onTap;
  final bool trailing;

  @override
  _AddressListTileState createState() => _AddressListTileState();
}

class _AddressListTileState extends State<AddressListTile> {
  bool test = false;
  @override
  Widget build(BuildContext context) {
    Color highlightColor = test ? primaryColor : Colors.black;
    return ListTile(
      tileColor: Colors.transparent,
      selected: test,
      selectedTileColor: Colors.red,
      title: Text(
        widget.address!.addressType!.label,
        style: TextStyle(color: highlightColor),
      ),
      subtitle: Text(
          widget.address != null
              ? widget.address!.street!
              : "Q. 208 Sul, Alameda 10, 202",
          style: TextStyle(color: highlightColor)),
      leading: Icon(
        widget.address!.addressType!.icon,
        color: highlightColor,
      ),
      trailing: widget.trailing
          ? IconButton(
              icon: Icon(
                Icons.more_vert,
                color: highlightColor,
              ),
              onPressed: () => Slidable.of(context)?.openStartActionPane(),
            )
          : null,
      onTap: widget.trailing
          ? () => Slidable.of(context)?.close()
          : widget.onTap ??
              () => setState(() {
                    test = !test;
                  }),
    );
  }
}
