import 'package:flutter/material.dart';
import 'package:pscomidas/app/global/models/entities/product.dart';
import 'package:pscomidas/app/modules/restaurant/widgets/product_card.dart';

class RestaurantMobilePage extends StatefulWidget {
  const RestaurantMobilePage({
    Key? key,
    required this.products,
  }) : super(key: key);

  final List<Product> products;

  _RestaurantMobilePageState createState() => _RestaurantMobilePageState();
}

class _RestaurantMobilePageState extends State<RestaurantMobilePage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width,
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 1,
            ),
            itemCount: 4,
            shrinkWrap: true,
            itemBuilder: (_, index) {
              Product product = widget.products[index];
              return ProductCard(product: product);
            },
          ),
        )
      ],
    );
  }
}
