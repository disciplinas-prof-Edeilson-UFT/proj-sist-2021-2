import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pscomidas/app/global/widgets/app_bar/components/components_app_bar.dart';
import 'package:pscomidas/app/modules/cart/cart_store.dart';
import 'package:pscomidas/app/modules/cart/components/payment/pages/desktop_pay_page.dart';
import 'package:pscomidas/app/modules/cart/components/payment/pages/mobile_pay_page.dart';
import 'package:pscomidas/app/modules/home/schemas.dart';

class PaymentPage extends StatefulWidget {
  static String paymentRouteName = '/payment';
  const PaymentPage({Key? key}) : super(key: key);

  @override
  _PaymentPageState createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  final CartStore store = Modular.get();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const LogoAppBar(),
        backgroundColor: primaryCollor,
        centerTitle: true,
        elevation: 2,
      ),
      backgroundColor: Colors.white,
      body: LayoutBuilder(
        builder: (context, constraints) {
          var height = constraints.maxHeight;
          var largura = constraints.maxWidth;
          if (height <= 647 && largura < 1360) {
            return const MobilePayPage();
          } else {
            return const DesktopPayPage();
          }
        },
      ),
    );
  }
}
