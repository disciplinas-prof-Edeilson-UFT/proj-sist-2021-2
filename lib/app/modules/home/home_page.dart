import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pscomidas/app/modules/category/custom_category.dart';
import 'package:pscomidas/app/global/widgets/app_bar/custom_app_bar.dart';
import 'package:pscomidas/app/global/widgets/bottom_appp_bar/bottom_app_bar_mobile.dart';
import 'package:pscomidas/app/modules/home/components/restaurant_grid.dart';
import 'package:pscomidas/app/modules/home/store/home_store.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key? key, this.title = "Home"}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeStore> {
  final homeStore = Modular.get<HomeStore>();

  @override
  Widget build(BuildContext context) {
    homeStore.setSelectedCategory(null);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const CustomAppBar(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            CustomCategory(),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 20),
              child: Text(
                "Lojas",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Nunito',
                ),
              ),
            ),
            RestaurantGrid(),
          ],
        ),
      ),
      bottomNavigationBar: const AppBarButton(),
    );
  }
}
