import 'package:flutter/material.dart';
import 'package:pscomidas/app/global/models/entities/product.dart';
import 'package:pscomidas/app/modules/restaurant/widgets/restaurant_top_bar.dart';
import 'package:pscomidas/app/modules/restaurant/widgets/product_card.dart';

class RestaurantDesktopPage extends StatefulWidget {
  const RestaurantDesktopPage({
    Key? key,
    required this.products,
  }) : super(key: key);

  final List<Product> products;

  @override
  _RestaurantDesktopPageState createState() => _RestaurantDesktopPageState();
}

class _RestaurantDesktopPageState extends State<RestaurantDesktopPage> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Center(
        child: Column(
          children: [
            const RestaurantTopBar(),
            Container(
              width: 2 * MediaQuery.of(context).size.width / 3,
              color: Colors.black12,
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1.7,
                  crossAxisSpacing: 10.0,
                  mainAxisSpacing: 20.0,
                ),
                itemCount: widget.products.length,
                shrinkWrap: true,
                itemBuilder: (_, index) {
                  Product product = widget.products[index];
                  return ProductCard(product: product);
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
