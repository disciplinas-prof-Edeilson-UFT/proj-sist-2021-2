import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:pscomidas/app/modules/home/schemas.dart';
import 'package:pscomidas/app/modules/order/components/rating_dialog.dart';

class RatingOrder extends StatelessWidget {
  const RatingOrder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size screen = MediaQuery.of(context).size;
    return SizedBox(
      width: screen.width * 0.39,
      height: screen.height * 0.075,
      child: Column(
        children: [
          const AutoSizeText(
            'Como estava seu pedido?',
            textAlign: TextAlign.left,
            presetFontSizes: [16, 14],
            style: TextStyle(
              fontFamily: 'Ninuto',
              fontWeight: FontWeight.w400,
            ),
          ),
          TextButton(
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (_) {
                    return RatingDialog();
                  });
            },
            style: TextButton.styleFrom(
              primary: primaryCollor,
            ),
            child: const Align(
              alignment: Alignment.center,
              child: AutoSizeText(
                'Avalie o pedido',
                presetFontSizes: [14, 12, 10],
                wrapWords: true,
                style: TextStyle(
                  color: secondaryCollor,
                  fontFamily: 'Ninuto',
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
