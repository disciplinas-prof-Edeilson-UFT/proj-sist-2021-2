import 'package:flutter/material.dart';
import 'package:pscomidas/app/modules/restaurant_home/components/card_product_page.dart';

class ProductPage extends StatelessWidget {
  const ProductPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: pageProductsResponsivity(MediaQuery.of(context).size.width));
  }
}

Widget pageProductsResponsivity(width) {
  if (width > 850) {
    return Column(
      children: [
        const TextAboveGrid(),
        Center(
          child: GridView.count(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            crossAxisCount: 5,
            mainAxisSpacing: 1,
            children: const [
              CardProductAdd(),
              CardProduct(image: "assets/images/product_page/card_image.png"),
              CardProduct(image: "assets/images/product_page/card_image.png"),
              CardProduct(image: "assets/images/product_page/card_image.png"),
              CardProduct(image: "assets/images/product_page/card_image.png"),
              CardProduct(image: "assets/images/product_page/card_image.png"),
              CardProduct(image: "assets/images/product_page/card_image.png"),
              CardProduct(image: "assets/images/product_page/card_image.png"),
              CardProduct(image: "assets/images/product_page/card_image.png"),
              CardProduct(image: "assets/images/product_page/card_image.png"),
            ],
          ),
        ),
      ],
    );
  }
  return SingleChildScrollView(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const TextAboveGrid(),
        Column(
          children: const [
            CardProductAdd(),
            CardProduct(image: "assets/images/product_page/card_image.png"),
            CardProduct(image: "assets/images/product_page/card_image.png"),
            CardProduct(image: "assets/images/product_page/card_image.png"),
            CardProduct(image: "assets/images/product_page/card_image.png"),
            CardProduct(image: "assets/images/product_page/card_image.png"),
            CardProduct(image: "assets/images/product_page/card_image.png"),
            CardProduct(image: "assets/images/product_page/card_image.png"),
            CardProduct(image: "assets/images/product_page/card_image.png"),
            CardProduct(image: "assets/images/product_page/card_image.png"),
            CardProduct(image: "assets/images/product_page/card_image.png"),
          ],
        ),
      ],
    ),
  );
}
