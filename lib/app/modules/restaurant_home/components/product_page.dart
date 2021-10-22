import 'package:flutter/material.dart';

class ProductPage extends StatelessWidget {
  const ProductPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: pageProductsResponsivity(MediaQuery.of(context).size.width),
    );
  }
}

// ignore: camel_case_types
class cardProduct extends StatefulWidget {
  const cardProduct({
    Key? key,
    required this.image,
  }) : super(key: key);
  final String image;
  // final String? nameOfProduct;
  @override
  _cardProductState createState() => _cardProductState();
}

// ignore: camel_case_types
class _cardProductState extends State<cardProduct> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        MouseRegion(
          cursor: SystemMouseCursors.click,
          child: InkWell(
            child: Image.asset(widget.image, width: 250),
          ),
        ),
      ],
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
            cardProduct(image: "assets/images/product_page/pluss.png"),
            cardProduct(image: "assets/images/product_page/card.png"),
            cardProduct(image: "assets/images/product_page/card.png"),
            cardProduct(image: "assets/images/product_page/card.png"),
            cardProduct(image: "assets/images/product_page/card.png"),
            cardProduct(image: "assets/images/product_page/card.png"),
            cardProduct(image: "assets/images/product_page/card.png"),
            cardProduct(image: "assets/images/product_page/card.png"),
            cardProduct(image: "assets/images/product_page/card.png"),
            cardProduct(image: "assets/images/product_page/card.png"),
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
            cardProduct(image: "assets/images/product_page/pluss.png"),
            cardProduct(image: "assets/images/product_page/card.png"),
            cardProduct(image: "assets/images/product_page/card.png"),
            cardProduct(image: "assets/images/product_page/card.png"),
            cardProduct(image: "assets/images/product_page/card.png"),
            cardProduct(image: "assets/images/product_page/card.png"),
            cardProduct(image: "assets/images/product_page/card.png"),
            cardProduct(image: "assets/images/product_page/card.png"),
            cardProduct(image: "assets/images/product_page/card.png"),
            cardProduct(image: "assets/images/product_page/card.png"),
          ],
        ),
      ],
    ),
  );
}
