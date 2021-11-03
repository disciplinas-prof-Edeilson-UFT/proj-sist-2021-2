import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pscomidas/app/global/repositories/order/order_repository.dart';
import 'package:pscomidas/app/modules/order/components/track/components/order_card.dart';
import 'package:pscomidas/app/modules/order/components/track/components/title_order_page.dart';
import 'package:pscomidas/app/modules/order/order_store.dart';

class BodyOrder extends StatefulWidget {
  const BodyOrder({Key? key}) : super(key: key);

  @override
  State<BodyOrder> createState() => _BodyOrderState();
}

class _BodyOrderState extends State<BodyOrder> {
  final OrderStore store = Modular.get();
  OrderRepository repository = Modular.get<OrderRepository>();

  @override
  Widget build(BuildContext context) {
    final Size screen = MediaQuery.of(context).size;
    int numCard = screen.width < 720 ? 1 : 2;

    double _aspectRatio() {
      if (screen.width < 560) {
        return (100 / 40);
      } else if (screen.width >= 560 && screen.width < 590) {
        return (100 / 37);
      } else if (screen.width >= 590 && screen.width < 720) {
        return (100 / 33);
      } else if (screen.width >= 720 && screen.width < 760) {
        return (100 / 57);
      } else if (screen.width >= 760 && screen.width < 860) {
        return (100 / 53);
      } else if (screen.width >= 860 && screen.width < 960) {
        return (100 / 49);
      } else if (screen.width >= 960 && screen.width < 1060) {
        return (100 / 43);
      } else if (screen.width >= 1060 && screen.width < 1170) {
        return (100 / 40);
      } else if (screen.width > 1160 && screen.width <= 1366) {
        return (100 / 37);
      }
      return (100 / 30);
    }

    return Padding(
      padding: EdgeInsets.all(screen.width * 0.008),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const TitleOrderPage(title: 'Meus Pedidos'),
          const SizedBox(
            height: 5,
          ),
          SizedBox(
            height: 270,
            width: screen.width * 0.9,
            child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: numCard, childAspectRatio: _aspectRatio()),
                itemCount: 1,
                itemBuilder: (BuildContext context, int index) {
                  return OrderCard();
                }),
          ),
          const TitleOrderPage(title: 'Mais pedidos por você'),
          const SizedBox(
            height: 100,
          ),
          const TitleOrderPage(title: 'Histórico'),
        ],
      ),
    );
  }
}
