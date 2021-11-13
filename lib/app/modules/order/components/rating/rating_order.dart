import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:pscomidas/app/modules/home/schemas.dart';
import 'package:pscomidas/app/modules/order/components/rating/rating_dialog.dart';

class RatingOrder extends StatelessWidget {
  const RatingOrder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: TextButton(
        onPressed: () {
          showDialog(
              context: context,
              builder: (_) {
                return const RatingDialog();
              });
        },
        style: TextButton.styleFrom(
          primary: primaryCollor,
        ),
        child: const AutoSizeText(
          'Avalie o pedido',
          presetFontSizes: [15, 12, 10],
          wrapWords: true,
          style: TextStyle(
            color: secondaryCollor,
            fontFamily: 'Ninuto',
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
