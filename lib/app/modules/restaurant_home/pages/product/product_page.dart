import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
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
        child: Column(
          children: [
            const Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: EdgeInsets.all(20),
                child: Text(
                  "Produtos",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    overflow: TextOverflow.ellipsis,
                    fontFamily: 'Nunito',
                  ),
                ),
              ),
            ),
            Wrap(
              spacing: 8,
              children: [
                const AddProduct(),
                ...List.filled(
                  store.products.length,
                  ProductCard(product: store.products[1]),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
