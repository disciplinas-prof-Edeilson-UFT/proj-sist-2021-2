import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';
import 'package:pscomidas/app/modules/restaurant_home/restaurant_home_store.dart';
import 'package:pscomidas/app/modules/restaurant_home/side_bar_components/menu_side_bar.dart';

class RestaurantHomePage extends StatefulWidget {
  final String title;
  const RestaurantHomePage({Key? key, this.title = 'RestaurantHomePage'})
      : super(key: key);
  @override
  RestaurantHomePageState createState() => RestaurantHomePageState();
}

class RestaurantHomePageState extends State<RestaurantHomePage> {
  final RestaurantHomeStore store = Modular.get();

  @override
  Widget build(BuildContext context) {
    final Size screen = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //side bar
            Container(
              width: screen.width * 0.2,
              child: const SideBar(),
            ),
            //main body
            Expanded(
              child: Container(),
            ),
          ],
        ),
      ),
    );
  }
}
