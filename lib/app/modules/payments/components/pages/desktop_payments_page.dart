import 'package:flutter/material.dart';
import 'package:pscomidas/app/modules/payments/components/cards_payments/paymentes_body.dart';

class DesktopPaymentsPage extends StatefulWidget {
  const DesktopPaymentsPage({ Key? key }) : super(key: key);

  @override
  _DesktopPaymentsPageState createState() => _DesktopPaymentsPageState();
}

class _DesktopPaymentsPageState extends State<DesktopPaymentsPage> {
  @override
  Widget build(BuildContext context) {
    return const PaymentsBody();
  }
}