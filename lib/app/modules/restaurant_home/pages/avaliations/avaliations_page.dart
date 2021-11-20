import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';
import 'package:pscomidas/app/modules/restaurant_home/restaurant_home_store.dart';

class AvaliationsPage extends StatefulWidget {
  static String get routeName => '/avaliations';
  final String title;
  const AvaliationsPage({Key? key, this.title = 'Avaliations Page'})
      : super(key: key);
  @override
  AvaliationsPageState createState() => AvaliationsPageState();
}

class AvaliationsPageState extends State<AvaliationsPage> {
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
