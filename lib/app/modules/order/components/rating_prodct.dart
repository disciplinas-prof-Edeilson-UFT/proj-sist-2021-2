import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:pscomidas/app/modules/order/components/rating_dialog.dart';

class RatingOrder extends StatelessWidget {
  const RatingOrder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size screen = MediaQuery.of(context).size;
    return SizedBox(
      width: screen.width * 0.35,
      height: screen.height * 0.05,
      child: ElevatedButton(
        onPressed: () {
          showDialog(
              context: context,
              builder: (_) {
                return const RatingDialog();
              });
        },
        style: ElevatedButton.styleFrom(
          primary: Colors.red.shade600,
        ),
        child: const AutoSizeText(
          'Avalie o pedido',
          presetFontSizes: [14, 12, 10],
          wrapWords: true,
          style: TextStyle(
            fontFamily: 'Ninuto',
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );
  }
}
