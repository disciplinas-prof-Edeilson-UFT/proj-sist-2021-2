// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:pscomidas/app/modules/order/components/ListView/card_order.dart';

class ListViewOrder extends StatelessWidget {
  const ListViewOrder({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size screen = MediaQuery.of(context).size;
    return Container(
      child: ListView.builder(
        itemCount: 3,
        itemBuilder: (context, index){
          return const CardOrder();
        },
      ),
    );
  }
}