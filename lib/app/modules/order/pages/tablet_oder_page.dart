import 'package:flutter/material.dart';
import 'package:pscomidas/app/modules/order/components/rating_prodct.dart';

class TabletOrderPage extends StatefulWidget {
  const TabletOrderPage({Key? key}) : super(key: key);

  @override
  _TabletOrderPageState createState() => _TabletOrderPageState();
}

class _TabletOrderPageState extends State<TabletOrderPage> {
  @override
  Widget build(BuildContext context) {
    return const RatingOrder();
  }
}