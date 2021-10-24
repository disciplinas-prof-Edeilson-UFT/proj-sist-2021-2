import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class PaymentTitle extends StatelessWidget {
  const PaymentTitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const AutoSizeText(
      'Finalize seu pedido',
      presetFontSizes: [30, 28],
      wrapWords: false,
      style: TextStyle(
        fontFamily: 'Nunito',
        color: Colors.black87,
        fontWeight: FontWeight.w600,
      ),
    );
  }
}
