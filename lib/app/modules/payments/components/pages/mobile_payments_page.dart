import 'package:flutter/material.dart';
import 'package:pscomidas/app/modules/payments/components/cards_payments/paymentes_body.dart';

class MobilePaymentsPage extends StatefulWidget {
  const MobilePaymentsPage({ Key? key }) : super(key: key);

  @override
  _MobilePaymentsPageState createState() => _MobilePaymentsPageState();
}

class _MobilePaymentsPageState extends State<MobilePaymentsPage> {
  @override
  Widget build(BuildContext context) {
    return const PaymentsBody();
  }
}