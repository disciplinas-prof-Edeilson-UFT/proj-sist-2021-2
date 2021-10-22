import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pscomidas/app/global/models/entities/item.dart';
import 'package:pscomidas/app/global/utils/format_money.dart';
import 'package:pscomidas/app/modules/cart/cart_store.dart';
import 'package:pscomidas/app/modules/home/schemas.dart';
import 'package:pscomidas/app/modules/restaurant/widgets/product_options/product_dialog.dart';

class DrawerBuilder extends StatefulWidget {
  final Item model;
  final double auxWidth;
  final double auxHeight;
  const DrawerBuilder({
    Key? key,
    required this.model,
    required this.auxWidth,
    required this.auxHeight,
  }) : super(key: key);

  @override
  _DrawerBuilderState createState() => _DrawerBuilderState();
}

class _DrawerBuilderState extends State<DrawerBuilder> {
  final CartStore store = Modular.get();
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.06,
          width: widget.auxWidth * 0.9,
          child: ListTile(
            title: AutoSizeText(
              widget.model.product.name.toString(),
              textAlign: TextAlign.center,
              presetFontSizes: const [20, 16],
              style: const TextStyle(
                fontFamily: 'Nunito',
                fontWeight: FontWeight.w600,
              ),
            ),
            leading: AutoSizeText(
              widget.model.quantidade.toString() + " x",
              presetFontSizes: const [14, 12],
              style: const TextStyle(
                fontFamily: 'Nunito',
                fontWeight: FontWeight.w600,
              ),
            ),
            trailing: Wrap(
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.only(left: 30),
                  child: AutoSizeText(
                    FormatMoney.doubleToMoney(
                        widget.model.product.price! * widget.model.quantidade),
                    presetFontSizes: const [14, 12],
                    style: const TextStyle(
                      fontFamily: 'Nunito',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (_) {
                    return ProductDialog(
                      product: widget.model.product,
                      isEditing: widget.model,
                    );
                  },
                );
              },
              child: const Align(
                alignment: Alignment.bottomCenter,
                child: Text(
                  'Editar',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: Colors.red,
                    fontFamily: 'Nunito',
                  ),
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                store.removeItem(widget.model.itemid);
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: const Text("Você removeu um item"),
                      actions: <Widget>[
                        // define os botões na base do dialogo
                        ElevatedButton(
                          child: const Text("Fechar",
                              style: TextStyle(color: primaryCollor)),
                          style: ElevatedButton.styleFrom(
                            primary: secondaryCollor,
                          ),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                      ],
                    );
                  },
                );
              },
              child: const Align(
                alignment: Alignment.bottomRight,
                child: Text(
                  'Remover',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontFamily: 'Nunito',
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
