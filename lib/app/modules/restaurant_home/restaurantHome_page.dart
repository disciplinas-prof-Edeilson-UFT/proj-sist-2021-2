import 'package:flutter_modular/flutter_modular.dart';
import 'package:pscomidas/app/modules/restaurant_home/restaurantHome_store.dart';
import 'package:flutter/material.dart';

class RestaurantHomePage extends StatefulWidget {
  final String title;
  const RestaurantHomePage({Key? key, this.title = 'RestaurantHomePage'}) : super(key: key);
  @override
  RestaurantHomePageState createState() => RestaurantHomePageState();
}
class RestaurantHomePageState extends State<RestaurantHomePage> {
  final RestaurantHomeStore store = Modular.get();

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