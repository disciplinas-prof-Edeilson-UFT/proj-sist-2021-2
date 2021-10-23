import 'package:flutter_modular/flutter_modular.dart';
import 'package:pscomidas/app/global/widgets/app_bar/custom_app_bar.dart';
import 'package:pscomidas/app/modules/cart/cart_page.dart';
import 'package:pscomidas/app/modules/order/order_store.dart';
import 'package:flutter/material.dart';
import 'package:pscomidas/app/modules/order/pages/desktop_oder_page.dart';
import 'package:pscomidas/app/modules/order/pages/mobile_oder_page.dart';
import 'package:pscomidas/app/modules/order/pages/tablet_oder_page.dart';

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
            } else if (width >= 1360 && width < 1920) {
              return const TabletOrderPage();
            } else {
              return const DesktopOrderPage();
            }
          },
        ),
      ),
    );
  }
}
