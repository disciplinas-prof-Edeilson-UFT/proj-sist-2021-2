import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:pscomidas/app/modules/home/schemas.dart';

class AddressListTile extends StatefulWidget {
  const AddressListTile({Key? key}) : super(key: key);

  @override
  _AddressListTileState createState() => _AddressListTileState();
}

class _AddressListTileState extends State<AddressListTile> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        GestureDetector(
          child: const ListTile(
            leading: Icon(Icons.location_on),
            title: Text(
              "Universidade Federal do Tocantins",
            ),
            subtitle: Text("Plano Diretor Sul, Palmas - TO, Brasil"),
          ),
        ),
        GestureDetector(
          child: const ListTile(
            leading: Icon(Icons.map),
            title: Text(
              "Não achei meu endereço",
              style: TextStyle(
                color: secondaryCollor,
              ),
            ),
            subtitle: Text("Buscar pelo mapa"),
          ),
          onTap: () {},
        ),
        Slidable(
          startActionPane: ActionPane(
            extentRatio: 0.2,
            motion: const BehindMotion(),
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
          child: ListTile(
            leading: const Icon(Icons.house),
            trailing: IconButton(
              icon: const Icon(
                Icons.more_vert,
                color: tertiaryCollor,
              ), onPressed: () {}, //=>Slidable.of(context)?.openStartActionPane(),
            ),
            title: const Text(
              "Casa",
            ),
            subtitle: const Text("Q. 208 Sul, Alameda 10, 202"),
            onTap: () {},
          ),
        ),
      ],
    );
  }
}
