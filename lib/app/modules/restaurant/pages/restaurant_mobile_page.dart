import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pscomidas/app/modules/restaurant/pages/components/product_grid.dart';
import 'package:pscomidas/app/modules/restaurant/restaurant_store.dart';
import 'package:pscomidas/app/modules/restaurant/widgets/restaurant_top_bar.dart';

class RestaurantMobilePage extends StatefulWidget {
  const RestaurantMobilePage({Key? key}) : super(key: key);

  @override
  _RestaurantMobilePageState createState() => _RestaurantMobilePageState();
}

class _RestaurantMobilePageState extends State<RestaurantMobilePage> {
  final restaurantStore = Modular.get<RestaurantStore>();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const RestaurantTopBar(),
          Observer(builder: (_) {
            if (restaurantStore.products.isEmpty) {
              return const Center(
                child: Text('Nenhum produto encontrado!'),
              );
            }
            return ProductGrid(products: restaurantStore.products);
          }),
        ],
      ),
    );
  }
}
