import 'package:flutter/material.dart';
import 'package:pscomidas/app/global/widgets/app_bar/custom_app_bar.dart';
import 'package:pscomidas/app/modules/cart/cart_page.dart';
import 'package:pscomidas/app/modules/order/track/order_details/pages/desktop_oder_details_page.dart';
import 'package:pscomidas/app/modules/order/track/order_details/pages/mobile_oder_details_page.dart';
import 'package:pscomidas/app/modules/order/track/order_details/pages/tablet_oder_details_page.dart';

class OrderDetailsPage extends StatefulWidget {
  static String orderDetailsRouteName = '/orderDetails';
  const OrderDetailsPage({ Key? key }) : super(key: key);

  @override
  _OrderDetailsPageState createState() => _OrderDetailsPageState();
}

class _OrderDetailsPageState extends State<OrderDetailsPage> {
  @override
  Widget build(BuildContext context) {
    final Size screen = MediaQuery.of(context).size;
    return Scaffold(
      appBar: const CustomAppBar(),
      endDrawer: const CartPage(),
      body: SafeArea(
        child: LayoutBuilder(
          builder: (_, constraints) {
            var width = constraints.maxWidth;
            if (width < 1360) {
              return const MobileOrderDetailsPage();
            } else if (width >= 1360 && width < 1920) {
              return const TabletOrderDetailsPage();
            } else {
              return const DesktopOrderDetailsPage();
            }
          },
        ),
      ),
    );
  }

}