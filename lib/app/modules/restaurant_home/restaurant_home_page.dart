import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pscomidas/app/global/widgets/side_bar/custom_side_bar.dart';
import 'package:pscomidas/app/modules/restaurant_home/restaurant_home_store.dart';

class RestaurantHomePage extends StatefulWidget {
  final String title;
  const RestaurantHomePage({Key? key, this.title = 'RestaurantHomePage'})
      : super(key: key);
  @override
  RestaurantHomePageState createState() => RestaurantHomePageState();
}

class RestaurantHomePageState extends State<RestaurantHomePage> {
  RestaurantHomeStore restaurantHomeStore = Modular.get<RestaurantHomeStore>();
  @override
  void initState() {
    restaurantHomeStore.getRestaurant();
    super.initState();
  }

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
              child: const CustomSideBar(),
            ),
            //main body
            Expanded(
              child: RouterOutlet(),
            ),
          ],
        ),
      ),
    );
  }
}
