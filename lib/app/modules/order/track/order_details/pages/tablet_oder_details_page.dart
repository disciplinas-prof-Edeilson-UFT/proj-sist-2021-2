import 'package:flutter/material.dart';
import 'package:pscomidas/app/modules/order/track/components/body_order.dart';
import 'package:pscomidas/app/modules/order/track/order_details/components/body_order_details.dart';

class TabletOrderDetailsPage extends StatefulWidget {
  const TabletOrderDetailsPage({Key? key}) : super(key: key);

  @override
  _TabletOrderDetailsPageState createState() => _TabletOrderDetailsPageState();
}

class _TabletOrderDetailsPageState extends State<TabletOrderDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return const BodyOrderDetails();
  }
}
