import 'package:flutter/material.dart';
import 'package:pscomidas/app/global/models/entities/product.dart';
import 'package:pscomidas/app/modules/restaurant/widgets/product_card.dart';

class ProductGrid extends StatelessWidget {
  const ProductGrid({
    Key? key,
    required this.products,
  }) : super(key: key);

  final List<Product> products;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 2 * MediaQuery.of(context).size.width / 3,
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 1.7,
          crossAxisSpacing: 10.0,
          mainAxisSpacing: 20.0,
        ),
        itemCount: products.length,
        shrinkWrap: true,
        itemBuilder: (_, index) {
          Product product = products[index];
          return ProductCard(product: product);
        },
      ),
    );
  }
}
