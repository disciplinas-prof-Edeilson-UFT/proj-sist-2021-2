import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pscomidas/app/modules/cart/cart_store.dart';
import 'package:pscomidas/app/modules/cart/components/drawer/components/company_header.dart';
import 'package:pscomidas/app/modules/cart/components/drawer/components/downside_drawer.dart';
import 'package:pscomidas/app/modules/cart/components/drawer/components/item_list.dart';

class TabletCartDrawer extends StatefulWidget {
  const TabletCartDrawer({
    Key? key,
  }) : super(key: key);

  @override
  _CartDrawerState createState() => _CartDrawerState();
}

class _CartDrawerState extends State<TabletCartDrawer> {
  final CartStore store = Modular.get();
  final GlobalKey drawerKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: const <Widget>[
          CompanyHeader(),
          ItenList(
            itenlengh: 2,
            heightFactor: 0.2,
          ),
          DraewDownside(),
        ],
      ),
    );
  }
}
