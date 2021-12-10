import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pscomidas/app/global/models/entities/restaurant.dart';
import 'package:pscomidas/app/modules/home/components/restaurant_card.dart';
import 'package:pscomidas/app/modules/home/store/home_store.dart';

//Esta é a página que constrói os cards conforme necessidade.

class RestaurantGrid extends StatefulWidget {
  const RestaurantGrid({Key? key}) : super(key: key);

  @override
  State<RestaurantGrid> createState() => _RestaurantGridState();
}

class _RestaurantGridState extends ModularState<RestaurantGrid, HomeStore> {
  final homeStore = Modular.get<HomeStore>();
  late Restaurant restaurant;

  @override
  void initState() {
    WidgetsFlutterBinding.ensureInitialized();
    homeStore.getRestaurants();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double _pageWidth = MediaQuery.of(context).size.width;
    return Observer(
      builder: (_) {
        homeStore.selectedFilter;
        var restaurants = homeStore.restaurants
            .where((e) => e.category.contains(homeStore.selectedCategory))
            .toList();
        restaurants = restaurants
            .where((e) =>
                e.socialName.toLowerCase().contains(homeStore.searchShop))
            .toList();
        return GridView.builder(
          scrollDirection: Axis.vertical,
          padding: const EdgeInsets.symmetric(horizontal: 12),
          shrinkWrap: true,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: _pageWidth > 1100
                ? 3
                : _pageWidth > 700
                    ? 2
                    : 1, //Responsivo horizontalmente
            mainAxisExtent: _pageWidth * 0.10 < 100
                ? 100
                : _pageWidth * 0.10, //Responsivo verticalmente (min 100 px)
            childAspectRatio: 3 / 2,
            crossAxisSpacing: 8,
            mainAxisSpacing: 8,
          ),
          itemCount: restaurants.length,
          itemBuilder: (context, index) => RestaurantCard(restaurants[index]),
        );
      },
    );
  }
}
