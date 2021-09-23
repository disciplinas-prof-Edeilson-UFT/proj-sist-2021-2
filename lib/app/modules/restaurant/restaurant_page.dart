import 'package:flutter_modular/flutter_modular.dart';
import 'package:pscomidas/app/modules/restaurant/restaurant_store.dart';
import 'package:flutter/material.dart';

class RestaurantPage extends StatefulWidget {
  final String title;
  const RestaurantPage({Key? key, this.title = 'RestaurantPage'}) : super(key: key);
  @override
  RestaurantPageState createState() => RestaurantPageState();
}
class RestaurantPageState extends State<RestaurantPage> {
  final RestaurantStore store = Modular.get();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: <Widget>[],
      ),
    );
  }
}