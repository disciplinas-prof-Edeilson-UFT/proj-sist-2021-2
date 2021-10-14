import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pscomidas/app/modules/cart/cart_store.dart';
import 'package:pscomidas/app/modules/cart/components/drawer/components/mobile/comp_header.dart';
import 'package:pscomidas/app/modules/cart/components/drawer/components/mobile/downside.dart';
import 'package:pscomidas/app/modules/cart/components/drawer/components/mobile/item_list.dart';

class MobileCartDrawer extends StatelessWidget {
  final double mobileLargura;
  MobileCartDrawer({
    Key? key,
    required this.mobileLargura,
  }) : super(key: key);

  final CartStore store = Modular.get();
  final GlobalKey drawerKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          const MobileCompanyHeader(),
          MobileItenList(
            itenlengh: 2,
            heightFactor: 0.3,
            widthFactor: mobileLargura,
          ),
          MobileDraewDownside(
            auxWidth: mobileLargura,
          ),
        ],
      ),
    );
  }
}
