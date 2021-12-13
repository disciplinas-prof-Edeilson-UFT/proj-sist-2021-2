import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:mobx/mobx.dart';
import 'package:pscomidas/app/global/models/entities/delivery_at.dart';
import 'package:pscomidas/app/global/models/enums/address_type.dart';
import 'package:pscomidas/app/global/utils/app_response.dart';
import 'package:pscomidas/app/global/utils/schemas.dart';
import 'package:pscomidas/app/modules/client_address/client_address_store.dart';

class SlidableAddressTile extends StatefulWidget {
  final DeliveryAt? address;

  const SlidableAddressTile({Key? key, this.address}) : super(key: key);

  @override
  _SlidableAddressTileState createState() => _SlidableAddressTileState();
}

@observable
class _SlidableAddressTileState extends State<SlidableAddressTile> {
  final ClientAddressStore store = Modular.get();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

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
            onPressed: (context) {
              store.isEditing = true;
              store.tempAddress = AppResponse.completed(widget.address);
              store.jump(2);
            },
          ),
          SlidableAction(
            icon: Icons.delete,
            backgroundColor: Colors.transparent,
            foregroundColor: secondaryColor,
            onPressed: (context) => showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: const Text(
                    'Você está prestes a deletar um de seus endereços salvos',
                    style: TextStyle(color: Colors.red),
                  ),
                  content:
                      const Text('Tem certeza que deseja apagar este endereço'),
                  actions: <Widget>[
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text(
                        'Cancelar',
                        style: TextStyle(
                          color: Colors.black87,
                          fontSize: 15,
                          decoration: TextDecoration.none,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        fixedSize: const Size.fromHeight(30),
                        primary: Colors.white,
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        store
                            .deleteAddress(uid: widget.address!.id!)
                            .then((value) => Navigator.pop(context));
                      },
                      child: const Text(
                        'Apagar',
                        style: TextStyle(
                          color: Colors.red,
                          fontSize: 15,
                          decoration: TextDecoration.none,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        fixedSize: const Size.fromHeight(30),
                        primary: Colors.white,
                      ),
                    ),
                  ],
                );
              },
            ),
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
