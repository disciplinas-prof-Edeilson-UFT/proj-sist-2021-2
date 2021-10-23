import 'package:flutter_modular/flutter_modular.dart';
import 'package:pscomidas/app/global/models/entities/restaurant.dart';
import 'package:pscomidas/app/global/widgets/app_bar/custom_app_bar.dart';
import 'package:pscomidas/app/modules/cart/cart_page.dart';
import 'package:pscomidas/app/modules/restaurant/pages/restaurant_desktop_page.dart';
import 'package:pscomidas/app/modules/restaurant/pages/restaurant_mobile_page.dart';
import 'package:pscomidas/app/modules/restaurant/restaurant_store.dart';
import 'package:flutter/material.dart';

class RestaurantPage extends StatefulWidget {
  final Restaurant restaurant;

  const RestaurantPage({
    Key? key,
    required this.restaurant,
  }) : super(key: key);

  @override
  RestaurantPageState createState() => RestaurantPageState();
}

class RestaurantPageState extends State<RestaurantPage> {
  final RestaurantStore store = Modular.get();

  @override
  void initState() {
    store.receiveRestaurantInfo(widget.restaurant);
    WidgetsFlutterBinding.ensureInitialized();
    super.initState();
  }

  @override
  void dispose() {
    store.products = [];
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      endDrawer: const CartPage(),
      body: SafeArea(
        child: LayoutBuilder(
          builder: (_, constrains) {
            var width = constrains.maxWidth;
            if (width < 600) {
              return const RestaurantMobilePage();
            } else {
              return const RestaurantDesktopPage();
            }
          },
        ),
      ),
    );
  }
}
