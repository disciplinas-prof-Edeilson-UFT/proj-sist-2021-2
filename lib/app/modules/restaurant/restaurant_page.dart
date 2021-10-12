import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pscomidas/app/global/widgets/app_bar/custom_app_bar.dart';
import 'package:pscomidas/app/modules/restaurant/pages/restaurant_desktop_page.dart';
import 'package:pscomidas/app/modules/restaurant/pages/restaurant_mobile_page.dart';
import 'package:pscomidas/app/modules/restaurant/restaurant_store.dart';
import 'package:flutter/material.dart';

class RestaurantPage extends StatefulWidget {
  final String title;
  const RestaurantPage({Key? key, this.title = 'RestaurantPage'})
      : super(key: key);
  @override
  RestaurantPageState createState() => RestaurantPageState();
}

class RestaurantPageState extends State<RestaurantPage> {
  final RestaurantStore store = Modular.get();
  final searchTitle = '';

  @override
  void initState() {
    store.getProducts(searchTitle);
    WidgetsFlutterBinding.ensureInitialized();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      endDrawer: Container(),
      body: SafeArea(
        child: LayoutBuilder(
          builder: (_, constrains) {
            var width = constrains.maxWidth;
            if (width < 600) {
              return RestaurantMobilePage(products: store.products);
            } else {
              return const RestaurantDesktopPage();
            }
          },
        ),
      ),
    );
  }
}
