import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pscomidas/app/global/models/entities/item.dart';
import 'package:pscomidas/app/modules/cart/cart_store.dart';
import 'package:pscomidas/app/modules/cart/components/cart_drawer/button/button_builder.dart';
import 'package:pscomidas/app/modules/cart/components/cart_drawer/cupom_field/cupon_field.dart';
import 'package:pscomidas/app/modules/cart/components/cart_drawer/item_builder/company_header.dart';
import 'package:pscomidas/app/modules/cart/components/cart_drawer/item_builder/item_builder.dart';
import 'package:pscomidas/app/modules/cart/components/cart_drawer/item_builder/oder_resume.dart';

class CartDrawer extends StatefulWidget {
  final List<Item> placeHolder;

  CartDrawer({
    Key? key,
    required this.placeHolder,
  }) : super(key: key);

  @override
  _CartDrawerState createState() => _CartDrawerState();
}

class _CartDrawerState extends State<CartDrawer> {
  final CartStore store = Modular.get();
  final GlobalKey drawerKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    Size screen = MediaQuery.of(context).size;
    return SizedBox(
      width: screen.width * 0.25,
      child: Drawer(
        key: drawerKey,
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              const CompanyHeader(),
              SizedBox(
                height: store.itens.length <= 6 ? null : screen.height * 0.6,
                child: ListView.separated(
                  separatorBuilder: (context, index) {
                    return const Divider(
                      height: 12,
                      color: Colors.black12,
                      indent: 20,
                      endIndent: 20,
                    );
                  },
                  shrinkWrap: true,
                  itemCount: store.itens.length,
                  itemBuilder: (context, index) {
                    final Item model = store.itens[index];
                    return DrawerBuilder(model: model);
                  },
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 20),
                alignment: Alignment.bottomCenter,
                child: const CupomField(),
              ),
              Container(
                margin: const EdgeInsets.only(top: 20),
                child: const OrderResume(),
              ),
              Container(
                margin: const EdgeInsets.only(top: 20),
                alignment: Alignment.bottomCenter,
                child: const ButtonBuilder(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
