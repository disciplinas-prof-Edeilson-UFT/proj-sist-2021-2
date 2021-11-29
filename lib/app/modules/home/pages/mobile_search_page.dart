import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';
import 'package:pscomidas/app/global/utils/schemas.dart';
import 'package:pscomidas/app/global/widgets/app_bar/components/components_app_bar.dart';
import 'package:pscomidas/app/global/widgets/bottom_app_bar/bottom_app_bar_mobile.dart';
import 'package:pscomidas/app/modules/home/components/restaurant_card.dart';
import 'package:pscomidas/app/modules/home/store/home_store.dart';

class MobileSearchPage extends StatefulWidget {
  static String get routeName => '/search';
  final String title;
  const MobileSearchPage({Key? key, this.title = 'Mobile search page'}) : super(key: key);
  @override
  MobileSearchPageState createState() => MobileSearchPageState();
}

class MobileSearchPageState extends State<MobileSearchPage> {
  final HomeStore store = Modular.get<HomeStore>();

  @override
  void initState() {
    if (store.restaurants.isEmpty) {
      store.getRestaurants();
    }
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double _pageWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      bottomNavigationBar: const AppBarButton(),
      appBar: AppBar(
        backgroundColor: Colors.white,
        toolbarHeight: 80,
        automaticallyImplyLeading: false,
        elevation: 0,
        title: Center(
          child: SizedBox(
            width: _pageWidth * 0.8,
            child: SearchArea(),
          ),
        ),
      ),
      body: Observer(
        builder: (context) {
          final restaurants = store.restaurants
            .where((e) => e.socialName.toLowerCase().contains(store.searchShop)).toList();
          if (store.restaurants.isEmpty) {
            return const Center(
                child: CircularProgressIndicator(
              color: secondaryColor,
            ));
          }
          return ListView.builder(
            itemCount: restaurants.length,
            itemBuilder: (context, index) => RestaurantCard(restaurants[index]),
          );
        }

      ),
    );
  }
}
