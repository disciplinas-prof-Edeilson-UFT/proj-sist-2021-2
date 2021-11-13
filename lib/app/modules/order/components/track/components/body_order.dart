import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pscomidas/app/global/repositories/order/order_repository.dart';
import 'package:pscomidas/app/modules/home/components/most_ordered.dart';
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
    int numCard = screen.width < 880 ? 1 : 2;

    double _aspectRatio() {
      double cardWidth;
      double cardHeight;
      if (screen.width > 880) {
        cardWidth = screen.width / 4.8;
        cardHeight = screen.height / 5;
      } else {
        cardWidth = screen.width / 4.8;
        cardHeight = screen.height / 13;
      }
      return (cardWidth / cardHeight);
    }

    return SingleChildScrollView(
      child: Center(
        child: SizedBox(
          width: screen.width > 880 ? screen.width * 0.6 : screen.width * 0.9,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 20,
              ),
              const TitleOrderPage(title: 'Meus Pedidos'),
              const SizedBox(
                height: 5,
              ),
              SizedBox(
                height: 200,
                width: screen.width,
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: numCard,
                      childAspectRatio: _aspectRatio()),
                  itemCount: 1,
                  itemBuilder: (BuildContext context, int index) {
                    return const OrderCard();
                  },
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const TitleOrderPage(title: 'Mais pedidos por você'),
              const SizedBox(
                height: 10,
              ),
              const MostOrdered(),
              const TitleOrderPage(title: 'Histórico'),
            ],
          ),
        ),
      ),
    );
  }
}
