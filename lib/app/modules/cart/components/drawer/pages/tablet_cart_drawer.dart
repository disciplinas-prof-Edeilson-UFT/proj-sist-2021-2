import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pscomidas/app/modules/cart/cart_store.dart';
import 'package:pscomidas/app/modules/cart/components/drawer/components/tablet/comp_header.dart';
import 'package:pscomidas/app/modules/cart/components/drawer/components/tablet/downside.dart';
import 'package:pscomidas/app/modules/cart/components/drawer/components/tablet/item_list.dart';

class TabletCartDrawer extends StatelessWidget {
  final double tabletLargura;
  TabletCartDrawer({
    Key? key,
    required this.tabletLargura,
  }) : super(key: key);

  final CartStore store = Modular.get();
  final GlobalKey drawerKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          const TabletCompanyHeader(),
          TabletItenList(
            itenlengh: 2,
            heightFactor: 0.2,
            widthFactor: tabletLargura,
          ),
          TabletDraewDownside(auxWidth: tabletLargura),
        ],
      ),
    );
  }
}
