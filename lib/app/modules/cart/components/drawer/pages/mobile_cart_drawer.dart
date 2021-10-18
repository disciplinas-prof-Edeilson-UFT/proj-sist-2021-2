import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pscomidas/app/modules/cart/cart_store.dart';
import 'package:pscomidas/app/modules/cart/components/drawer/components/comp_header.dart';
import 'package:pscomidas/app/modules/cart/components/drawer/components/downside.dart';
import 'package:pscomidas/app/modules/cart/components/drawer/components/item_list.dart';
import 'package:pscomidas/app/modules/cart/components/payment/pages/payment_page.dart';

class MobileCartDrawer extends StatelessWidget {
  final double mobileLargura;
  final String buttonTxt;
  MobileCartDrawer({
    Key? key,
    required this.mobileLargura,
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
            itenlengh: 2,
            heightFactor: 0.3,
            widthFactor: mobileLargura,
          ),
          DraewDownside(
            buttonTxt: buttonTxt,
            auxWidth: mobileLargura,
            route: PaymentPage.paymentRouteName,
          ),
        ],
      ),
    );
  }
}
