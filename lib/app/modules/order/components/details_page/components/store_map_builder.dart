import 'package:flutter/material.dart';
import 'package:pscomidas/app/modules/order/components/details_page/components/detail_button.dart';
import 'package:pscomidas/app/modules/order/components/details_page/components/background_image.dart';
import 'package:pscomidas/app/modules/order/components/details_page/components/store_name.dart';
import 'package:pscomidas/app/modules/order/components/rating/rating_prodct.dart';

class StoreMapBuilder extends StatelessWidget {
  const StoreMapBuilder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size screen = MediaQuery.of(context).size;
    return Stack(
      children: [
        const BackgroundImage(),
        Container(
          color: Colors.white.withOpacity(0.7),
        ),
        Positioned(
          right: -20,
          top: 160,
          child: SizedBox(
            width: screen.width * 0.35,
            height: screen.height * 0.20,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                StoreName(
                  storeName: 'Frutos de Goiás',
                ),
                DetailButton(
                  name: 'Detalhes do pedido',
                ),
              ],
            ),
          ),
        ),
        const Positioned(
          right: 187,
          top: 450,
          child: RatingOrder(),
        ),
      ],
    );
  }
}
