import 'package:flutter/material.dart';
import 'package:pscomidas/app/modules/order/components/bodyOrder_page/body_order.dart';

class DesktopOrderPage extends StatefulWidget {
  const DesktopOrderPage({Key? key}) : super(key: key);

  @override
  _DesktopOrderPageState createState() => _DesktopOrderPageState();
}

class _DesktopOrderPageState extends State<DesktopOrderPage> {
  @override
  Widget build(BuildContext context) {
    return const BodyOrder();
  }
}
