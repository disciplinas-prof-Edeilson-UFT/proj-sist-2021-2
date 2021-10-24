import 'package:flutter/material.dart';
import 'package:pscomidas/app/modules/order/components/rating_prodct.dart';

class MobileOrderPage extends StatefulWidget {
  const MobileOrderPage({Key? key}) : super(key: key);

  @override
  _MobileOrderPageState createState() => _MobileOrderPageState();
}

class _MobileOrderPageState extends State<MobileOrderPage> {
  @override
  Widget build(BuildContext context) {
    return const RatingOrder();
  }
}
