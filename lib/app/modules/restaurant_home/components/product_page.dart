import 'package:flutter/material.dart';
import 'package:pscomidas/app/modules/restaurant_home/components/product_card.dart';

class ProductPage extends StatelessWidget {
  const ProductPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: pageProductsResponsivity(width),
    );
  }
}

Widget pageProductsResponsivity(width) {
  if (width > 850) {
    return Column(
      children: [
        const Align(
          alignment: Alignment.topCenter,
          child: Padding(
            padding: EdgeInsets.all(20),
            child: Text(
              "Produtos",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 40,
                overflow: TextOverflow.ellipsis,
                fontFamily: 'Nunito',
              ),
            ),
          ),
        ),
        Center(
          child: GridView.count(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            crossAxisCount: 5,
            mainAxisSpacing: 1,
            children: [
              addProduct(),
              ...List.filled(
                9,
                const ProductCard(
                  image: "assets/images/product_page/card_image.png",
                ),
              ),
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
        const Align(
          alignment: Alignment.topCenter,
          child: Padding(
            padding: EdgeInsets.all(20),
            child: Text(
              "Produtos",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 40,
                overflow: TextOverflow.ellipsis,
                fontFamily: 'Nunito',
              ),
            ),
          ),
        ),
        Column(
          children: [
            addProduct(),
            ...List.filled(
              9,
              const ProductCard(
                  image: "assets/images/product_page/card_image.png"),
            )
          ],
        ),
      ],
    ),
  );
}
