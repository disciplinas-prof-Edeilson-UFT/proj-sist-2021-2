import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pscomidas/app/global/models/entities/item.dart';
import 'package:pscomidas/app/modules/cart/cart_store.dart';
import 'package:pscomidas/app/modules/cart/components/drawer/components/comp_header.dart';
import 'package:pscomidas/app/modules/cart/components/drawer/components/order_resume.dart';
import 'package:pscomidas/app/modules/cart/components/payment/components/pay_item_builder.dart';
import 'package:pscomidas/app/modules/home/schemas.dart';

class OrderContainer extends StatelessWidget {
  OrderContainer({Key? key}) : super(key: key);

  final CartStore store = Modular.get();
  @override
  Widget build(BuildContext context) {
    Size screen = MediaQuery.of(context).size;
    return Container(
      padding: const EdgeInsets.all(6),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0, 3),
          )
        ],
        color: Colors.white,
      ),
      child: Column(
        children: [
          const CompanyHeader(),
          const Divider(thickness: 1, color: dividerCollor),
          ListView.separated(
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
              return PayDrawerBuilder(
                model: model,
                auxHeight: 0.4,
                auxWidth: screen.width * 0.9,
              );
            },
          ),
          const Divider(thickness: 1, color: Colors.black38),
          OrderResume(
            auxWidth: screen.width * 0.9,
          ),
        ],
      ),
    );
  }
}
