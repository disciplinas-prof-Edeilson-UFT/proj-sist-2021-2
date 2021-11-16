import 'package:flutter_modular/flutter_modular.dart';
import 'package:pscomidas/app/global/widgets/app_bar/custom_app_bar.dart';
import 'package:pscomidas/app/modules/cart/cart_page.dart';
import 'package:pscomidas/app/modules/order/components/track/pages/desktop_order_page.dart';
import 'package:pscomidas/app/modules/order/components/track/pages/mobile_order_page.dart';
import 'package:pscomidas/app/modules/order/order_store.dart';
import 'package:flutter/material.dart';

class OrderPage extends StatefulWidget {
  const OrderPage({Key? key}) : super(key: key);
  @override
  OrderPageState createState() => OrderPageState();
}

class OrderPageState extends State<OrderPage> {
  final OrderStore store = Modular.get();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      endDrawer: const CartPage(),
      body: SafeArea(
        child: LayoutBuilder(
          builder: (_, constraints) {
            var width = constraints.maxWidth;
            if (width < 1360) {
              return const MobileOrderPage();
            } else {
              return const DesktopOrderPage();
            }
          },
        ),
      ),
    );
  }
}
