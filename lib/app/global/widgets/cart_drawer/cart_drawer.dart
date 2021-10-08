import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pscomidas/app/global/widgets/cart_drawer/item_builder/item_builder.dart';
import 'package:pscomidas/app/global/widgets/cart_drawer/placeholder/pedido.dart';
import 'package:pscomidas/app/modules/cart/cart_store.dart';

class CartDrawer extends StatefulWidget {
  final List<ItemModel> placeHolder;

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
              Expanded(
                child: ListView.builder(
                  padding: const EdgeInsets.all(5.0),
                  itemCount: widget.placeHolder.length,
                  itemBuilder: (context, index) {
                    final ItemModel model = widget.placeHolder[index];
                    return DrawerBuilder(
                      model: model,
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
