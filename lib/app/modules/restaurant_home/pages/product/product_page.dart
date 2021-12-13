import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pscomidas/app/global/models/entities/product.dart';
import 'package:pscomidas/app/modules/restaurant_home/pages/product/add_product_card.dart';
import 'package:pscomidas/app/modules/restaurant_home/pages/product/product_card.dart';
import 'package:pscomidas/app/modules/restaurant_home/restaurant_home_store.dart';

class ProductPage extends StatefulWidget {
  static String get routeName => '/products';
  const ProductPage({Key? key}) : super(key: key);

  @override
  _ProductPageState createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  final store = Modular.get<RestaurantHomeStore>();

  @override
  void initState() {
    store.getProducts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 3.5,
            crossAxisSpacing: 5.0,
            mainAxisSpacing: 5.0,
          ),
          itemCount: store.products.length,
          shrinkWrap: true,
          itemBuilder: (_, index) {
            Product product = store.products[index];
            return ProductCard(product: product);
          },
        ),
      ),
    );
  }
}
