import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';
import 'package:pscomidas/app/global/widgets/side_bar/components_side_bar/menu_side_bar.dart';
import 'package:pscomidas/app/modules/home/schemas.dart';
import 'package:pscomidas/app/modules/restaurant_home/restaurant_home_store.dart';

class RestaurantHomePage extends StatefulWidget {
  final String title;
  const RestaurantHomePage({Key? key, this.title = 'RestaurantHomePage'})
      : super(key: key);
  @override
  RestaurantHomePageState createState() => RestaurantHomePageState();
}

class RestaurantHomePageState extends State<RestaurantHomePage> {
  //final RestaurantHomeStore store = Modular.get();

  @override
  Widget build(BuildContext context) {
    final Size screen = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //side bar
            SizedBox(
              width: screen.width * 0.2,
              child: const SideBar(),
            ),
            //main body
            Expanded(
              // ignore: avoid_unnecessary_containers
              child: Container(
                child: const Text(
                  "Produtos",
                  style: TextStyle(
                    color: secondaryCollor,
                    fontFamily: "Nunito",
                    fontSize: 40,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
