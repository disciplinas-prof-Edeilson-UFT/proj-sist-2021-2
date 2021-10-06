import 'package:flutter/material.dart';
import 'package:pscomidas/app/modules/restaurant/widgets/product_card.dart';

class RestaurantMobilePage extends StatefulWidget {
  const RestaurantMobilePage({Key? key}) : super(key: key);

  @override
  _RestaurantMobilePageState createState() => _RestaurantMobilePageState();
}

class _RestaurantMobilePageState extends State<RestaurantMobilePage> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 1,
              ),
              itemCount: 4,
              shrinkWrap: true,
              itemBuilder: (_, index) {
                return ProductCard();
              },
            ),
          )
        ],
      ),
    );
  }
}
