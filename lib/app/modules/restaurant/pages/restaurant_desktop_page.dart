import 'package:flutter/material.dart';
import 'package:pscomidas/app/modules/restaurant/widgets/product_card.dart';

class RestaurantDesktopPage extends StatefulWidget {
  const RestaurantDesktopPage({Key? key}) : super(key: key);

  @override
  _RestaurantDesktopPageState createState() => _RestaurantDesktopPageState();
}

class _RestaurantDesktopPageState extends State<RestaurantDesktopPage> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Center(
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width * 0.6,
              color: Colors.black12,
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10.0,
                  mainAxisSpacing: 10.0,
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
      ),
    );
  }
}
