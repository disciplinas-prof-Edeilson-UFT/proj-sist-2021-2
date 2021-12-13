import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';
import 'package:pscomidas/app/global/utils/schemas.dart';
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
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: const <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 12),
            child: Text(
              "Cupons",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                overflow: TextOverflow.ellipsis,
                fontFamily: 'Nunito',
              ),
            ),
          ),
        ],
      ),
    );
  }
}
