import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';
import 'package:pscomidas/app/modules/restaurant_home/restaurant_home_store.dart';

class OrdersPage extends StatefulWidget {
  static String get routeName => '/orders';
  final String title;
  const OrdersPage({Key? key, this.title = 'Orders Page'}) : super(key: key);
  @override
  OrdersPageState createState() => OrdersPageState();
}

class OrdersPageState extends State<OrdersPage> {
  final RestaurantHomeStore store = Modular.get<RestaurantHomeStore>();

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
