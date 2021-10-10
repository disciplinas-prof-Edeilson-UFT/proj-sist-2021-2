import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pscomidas/app/modules/restaurant/pages/components/product_grid.dart';
import 'package:pscomidas/app/modules/restaurant/restaurant_store.dart';
import 'package:pscomidas/app/modules/restaurant/widgets/restaurant_top_bar.dart';

class RestaurantDesktopPage extends StatefulWidget {
  const RestaurantDesktopPage({
    Key? key,
  }) : super(key: key);

  @override
  _RestaurantDesktopPageState createState() => _RestaurantDesktopPageState();
}

class _RestaurantDesktopPageState extends State<RestaurantDesktopPage> {
  final restaurantStore = Modular.get<RestaurantStore>();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Center(
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
      ),
    );
  }
}
