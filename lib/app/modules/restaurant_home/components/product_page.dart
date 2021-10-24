import 'package:flutter/material.dart';
import 'package:pscomidas/app/modules/restaurant_home/components/product_card.dart';

class ProductPage extends StatelessWidget {
  const ProductPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
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
          pageProductsResponsivity(width),
        ],
      ),
    );
  }
}

Widget pageProductsResponsivity(width) {
  if (width > 850) {
    return Center(
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
    );
  }
  return SingleChildScrollView(
    child: Column(
      children: [
        addProduct(),
        ...List.filled(
          9,
          const ProductCard(image: "assets/images/product_page/card_image.png"),
        )
      ],
    ),
  );
}
