import 'package:flutter_modular/flutter_modular.dart';
import 'package:pscomidas/app/modules/order/order_store.dart';
import 'package:flutter/material.dart';

class OrderPage extends StatefulWidget {
  final String title;
  const OrderPage({Key? key, this.title = 'OrderPage'}) : super(key: key);
  @override
  OrderPageState createState() => OrderPageState();
}

class OrderPageState extends State<OrderPage> {
  final OrderStore store = Modular.get();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: const <Widget>[],
      ),
    );
  }
}
