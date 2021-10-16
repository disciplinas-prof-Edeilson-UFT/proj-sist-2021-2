// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pscomidas/app/modules/order/components/bodyOrder_page/ListView/card_order.dart';
import 'package:pscomidas/app/modules/order/order_store.dart';

class ListViewOrder extends StatefulWidget {
  const ListViewOrder({ Key? key }) : super(key: key);

  @override
  State<ListViewOrder> createState() => _ListViewOrderState();
}

class _ListViewOrderState extends State<ListViewOrder> {

  final OrderStore store = Modular.get();

  @override
  Widget build(BuildContext context) {
    final Size screen = MediaQuery.of(context).size;
    return Container(
      width: screen.width,
      height: screen.height * 0.7,
      child: ListView.builder(
        itemCount: store.order.length,
        itemBuilder: (context, index){
          return CardOrder(index: index,);
        },
      ),
    );
  }
}
