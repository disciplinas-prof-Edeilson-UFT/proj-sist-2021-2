import 'package:flutter/material.dart';
import 'package:pscomidas/app/modules/order/track/components/body_order.dart';
import 'package:pscomidas/app/modules/order/track/order_details/components/body_order_details.dart';

class DesktopOrderDetailsPage extends StatefulWidget {
  const DesktopOrderDetailsPage({Key? key}) : super(key: key);

  @override
  _DesktopOrderDetailsPageState createState() => _DesktopOrderDetailsPageState();
}

class _DesktopOrderDetailsPageState extends State<DesktopOrderDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return const BodyOrderDetails();
  }
}
