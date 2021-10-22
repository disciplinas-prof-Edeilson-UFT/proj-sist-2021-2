import 'package:flutter/material.dart';

class ProductPage extends StatelessWidget {
  const ProductPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: pageProductsResponsivity(MediaQuery.of(context).size.width),
      ),
    );
  }
}

class CardProduct extends StatefulWidget {
  const CardProduct({
    Key? key,
    required this.image,
  }) : super(key: key);
  final String image;

  @override
  _CardProductState createState() => _CardProductState();
}

class _CardProductState extends State<CardProduct> {
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
            CardProduct(image: "assets/images/product_page/pluss.png"),
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
            CardProduct(image: "assets/images/product_page/pluss.png"),
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
