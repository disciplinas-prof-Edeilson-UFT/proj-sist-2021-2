import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pscomidas/app/modules/cart/cart_store.dart';
import 'package:pscomidas/app/modules/cart/components/drawer/components/comp_header.dart';
import 'package:pscomidas/app/modules/cart/components/drawer/components/downside.dart';
import 'package:pscomidas/app/modules/cart/components/drawer/components/item_list.dart';

class DesktopCartDrawer extends StatelessWidget {
  final double deskLargura;
  final String buttonTxt;
  DesktopCartDrawer({
    Key? key,
    required this.deskLargura,
    required this.buttonTxt,
  }) : super(key: key);

  final CartStore store = Modular.get();
  final GlobalKey drawerKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          const CompanyHeader(),
          ItenList(
            itenlengh: 4,
            heightFactor: 0.30,
            widthFactor: deskLargura,
          ),
          DraewDownside(
            buttonTxt: buttonTxt,
            auxWidth: deskLargura,
          ),
        ],
      ),
    );
  }
}
