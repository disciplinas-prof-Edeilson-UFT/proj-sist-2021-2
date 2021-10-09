import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pscomidas/app/modules/cart/pages/form_payment/form_payment_page.dart';

class ButtonBuilder extends StatefulWidget {
  const ButtonBuilder({Key? key}) : super(key: key);

  @override
  _ButtonBuilderState createState() => _ButtonBuilderState();
}

class _ButtonBuilderState extends State<ButtonBuilder> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(5),
        child: Stack(
          children: <Widget>[
            Positioned.fill(
              child: Container(
                decoration: const BoxDecoration(color: Colors.red),
              ),
            ),
            TextButton(
              style: TextButton.styleFrom(
                padding: const EdgeInsets.all(16.0),
                primary: Colors.white,
                textStyle: const TextStyle(fontSize: 20),
              ),
              onPressed: () =>
                  null, //Modular.to.pushNamed(FormPaymentPage.routeName),
              child: const Text('Pagar'),
            ),
          ],
        ),
      ),
    );
  }
}
