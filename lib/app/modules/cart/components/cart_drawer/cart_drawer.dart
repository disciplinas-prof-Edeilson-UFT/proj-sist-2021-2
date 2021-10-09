import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pscomidas/app/global/models/entities/item.dart';
import 'package:pscomidas/app/modules/cart/cart_store.dart';
import 'package:pscomidas/app/modules/cart/components/cart_drawer/button/button_builder.dart';
import 'package:pscomidas/app/modules/cart/components/cart_drawer/item_builder/item_builder.dart';

class CartDrawer extends StatefulWidget {
  final List<Item> placeHolder;

  CartDrawer({
    required this.placeHolder,
  });

  @override
  _CartDrawerState createState() => _CartDrawerState();
}

class _CartDrawerState extends State<CartDrawer> {
  final CartStore store = Modular.get();
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.bottomRight,
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.3,
        //height: MediaQuery.of(context).size.height * 0.94,
        child: Drawer(
          child: Column(
            children: <Widget>[
              Container(
                margin: const EdgeInsets.only(top: 40),
                child: SizedBox(
                  height: MediaQuery.of(context).size.height * 0.5,
                  child: Expanded(
                    child: ListView.builder(
                      padding: const EdgeInsets.all(5.0),
                      itemCount: store.placeholder.length,
                      itemBuilder: (context, index) {
                        final Item model = store.placeholder[index];
                        return DrawerBuilder(
                          model: model,
                        );
                      },
                    ),
                  ),
                ),
              ),
              Container(
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
