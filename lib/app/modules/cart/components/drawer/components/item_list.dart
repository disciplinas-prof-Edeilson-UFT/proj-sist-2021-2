import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pscomidas/app/global/models/entities/item.dart';
import 'package:pscomidas/app/modules/cart/cart_store.dart';
import 'package:pscomidas/app/modules/cart/components/drawer/components/item_builder.dart';

class ItenList extends StatelessWidget {
  final double heightFactor;
  final int itenlengh;
  final double widthFactor;

  const ItenList({
    Key? key,
    required this.itenlengh,
    required this.heightFactor,
    required this.widthFactor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final CartStore store = Modular.get();
    Size screen = MediaQuery.of(context).size;
    return SizedBox(
      height:
          store.itens.length <= itenlengh ? null : screen.height * heightFactor,
      child: Observer(builder: (_) {
        return ListView.separated(
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
            return DrawerBuilder(
              model: model,
              auxHeight: heightFactor,
              auxWidth: widthFactor,
            );
          },
        );
      }),
    );
  }
}
