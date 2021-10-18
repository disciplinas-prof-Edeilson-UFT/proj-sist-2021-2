import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pscomidas/app/global/widgets/app_bar/components/components_app_bar.dart';
import 'package:pscomidas/app/modules/cart/cart_store.dart';
import 'package:pscomidas/app/modules/cart/components/payment/components/card_select.dart';
import 'package:pscomidas/app/modules/cart/components/payment/components/endereco_entrega.dart';
import 'package:pscomidas/app/modules/cart/components/payment/components/prev_entrega.dart';

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
    Size screen = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: const LogoAppBar(),
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 0,
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: SizedBox(
            width: screen.width * 0.6,
            child: Wrap(
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  width: screen.width * 0.3,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: const <Widget>[
                      Divider(
                        thickness: 90,
                        color: Colors.transparent,
                      ),
                      AutoSizeText(
                        'Finalize seu pedido',
                        presetFontSizes: [30, 28],
                        wrapWords: false,
                        style: TextStyle(
                          fontFamily: 'Ninuto',
                          color: Colors.black87,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Divider(
                        thickness: 70,
                        color: Colors.transparent,
                      ),
                      EnderecoEntrega(),
                      Divider(
                        thickness: 70,
                        color: Colors.transparent,
                      ),
                      PrevEntrega(),
                      Divider(
                        color: Colors.red,
                      ),
                      CardSelect(),
                    ],
                  ),
                ),
                Container(
                  color: Colors.red,
                  child: Column(
                    children: const <Widget>[
                      Text('teste'),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
