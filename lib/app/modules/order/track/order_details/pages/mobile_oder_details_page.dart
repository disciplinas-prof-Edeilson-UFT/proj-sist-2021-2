import 'package:flutter/material.dart';
import 'package:pscomidas/app/modules/order/track/components/body_order.dart';
import 'package:pscomidas/app/modules/order/track/order_details/components/body_order_details.dart';

class MobileOrderDetailsPage extends StatefulWidget {
  const MobileOrderDetailsPage({Key? key}) : super(key: key);

  @override
  _MobileOrderDetailsPageState createState() => _MobileOrderDetailsPageState();
}

class _MobileOrderDetailsPageState extends State<MobileOrderDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return const BodyOrderDetails();
  }
}
