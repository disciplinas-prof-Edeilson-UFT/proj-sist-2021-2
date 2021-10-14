import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pscomidas/app/modules/cart/cart_store.dart';
import 'package:pscomidas/app/modules/cart/components/drawer/components/desk/comp_header.dart';
import 'package:pscomidas/app/modules/cart/components/drawer/components/desk/downside.dart';
import 'package:pscomidas/app/modules/cart/components/drawer/components/desk/item_list.dart';

class DesktopCartDrawer extends StatelessWidget {
  final double deskLargura;
  DesktopCartDrawer({
    Key? key,
    required this.deskLargura,
  }) : super(key: key);

  final CartStore store = Modular.get();
  final GlobalKey drawerKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          const DeskCompanyHeader(),
          DeskItenList(
            itenlengh: 6,
            heightFactor: 0.6,
            widthFactor: deskLargura,
          ),
          DeskDraewDownside(
            auxWidth: deskLargura,
          ),
        ],
      ),
    );
  }
}
