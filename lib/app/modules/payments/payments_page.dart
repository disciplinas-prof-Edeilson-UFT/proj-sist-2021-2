import 'package:flutter_modular/flutter_modular.dart';
import 'package:pscomidas/app/global/widgets/app_bar/custom_app_bar.dart';
import 'package:pscomidas/app/modules/cart/cart_page.dart';
import 'package:pscomidas/app/modules/payments/components/pages/desktop_payments_page.dart';
import 'package:pscomidas/app/modules/payments/components/pages/mobile_payments_page.dart';
import 'package:pscomidas/app/modules/payments/payments_store.dart';
import 'package:flutter/material.dart';

class PaymentsPage extends StatefulWidget {
  final String title;
  const PaymentsPage({Key? key, this.title = 'PaymentsPage'}) : super(key: key);
  @override
  PaymentsPageState createState() => PaymentsPageState();
}
class PaymentsPageState extends State<PaymentsPage> {
  final PaymentsStore store = Modular.get();

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
              return const MobilePaymentsPage();
            } else {
              return const DesktopPaymentsPage();
            }
          },
        ),
      ),
    );
  }
}