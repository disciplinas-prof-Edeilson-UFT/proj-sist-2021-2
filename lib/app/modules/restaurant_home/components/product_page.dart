import 'package:flutter/material.dart';
import 'package:pscomidas/app/modules/restaurant_home/components/add_product_card.dart';
import 'package:pscomidas/app/modules/restaurant_home/components/product_card.dart';

class ProductPage extends StatelessWidget {
  const ProductPage({Key? key}) : super(key: key);

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
                addProduct(),
                ...List.filled(
                  20,
                  const ProductCard(),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
