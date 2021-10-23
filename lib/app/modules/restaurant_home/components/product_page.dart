import 'package:flutter/material.dart';
import 'package:pscomidas/app/modules/restaurant_home/components/card_product_page.dart';

class ProductPage extends StatelessWidget {
  const ProductPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pageProductsResponsivity(MediaQuery.of(context).size.width),
    );
  }
}

Widget pageProductsResponsivity(width) {
  if (width > 850) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(30.0),
        child: GridView.count(
          crossAxisCount: 5,
          mainAxisSpacing: 3,
          children: const [
            CardProductAdd(),
            CardProduct(image: "assets/images/product_page/card.png"),
            CardProduct(image: "assets/images/product_page/card.png"),
            CardProduct(image: "assets/images/product_page/card.png"),
            CardProduct(image: "assets/images/product_page/card.png"),
            CardProduct(image: "assets/images/product_page/card.png"),
            CardProduct(image: "assets/images/product_page/card.png"),
            CardProduct(image: "assets/images/product_page/card.png"),
            CardProduct(image: "assets/images/product_page/card.png"),
            CardProduct(image: "assets/images/product_page/card.png"),
          ],
        ),
      ),
    );
  }
  return SingleChildScrollView(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Column(
          children: const [
            CardProductAdd(),
            CardProduct(image: "assets/images/product_page/card.png"),
            CardProduct(image: "assets/images/product_page/card.png"),
            CardProduct(image: "assets/images/product_page/card.png"),
            CardProduct(image: "assets/images/product_page/card.png"),
            CardProduct(image: "assets/images/product_page/card.png"),
            CardProduct(image: "assets/images/product_page/card.png"),
            CardProduct(image: "assets/images/product_page/card.png"),
            CardProduct(image: "assets/images/product_page/card.png"),
            CardProduct(image: "assets/images/product_page/card.png"),
            CardProduct(image: "assets/images/product_page/card.png"),
          ],
        ),
      ],
    ),
  );
}
