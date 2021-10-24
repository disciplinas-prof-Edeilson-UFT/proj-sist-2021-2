import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:pscomidas/app/modules/home/schemas.dart';

class RatingDialog extends StatelessWidget {
  const RatingDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size screen = MediaQuery.of(context).size;
    return AlertDialog(
      title: const Center(child: Text("Reportar danos")),
      actions: <Widget>[
        Center(
          child: RatingBar.builder(
            initialRating: 1,
            minRating: 0,
            direction: Axis.horizontal,
            allowHalfRating: true,
            itemCount: 5,
            itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
            glowColor: primaryCollor,
            itemBuilder: (context, _) => const Icon(
              Icons.star,
              color: secondaryCollor,
              size: 8,
            ),
            onRatingUpdate: (rating) {},
          ),
        ),
        const Divider(
          height: 20,
        ),
        Center(
          child: SizedBox(
            width: screen.width * 0.3,
            child: const TextField(
              keyboardType: TextInputType.multiline,
              maxLines: null,
              enabled: true,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18,
                fontFamily: 'Nunito',
              ),
              decoration: InputDecoration(
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.red),
                ),
                hintText: 'Escreva uma avaliação',
                hintStyle: TextStyle(
                  fontFamily: 'Nunito',
                  fontSize: 14,
                  color: Colors.black,
                  fontWeight: FontWeight.w300,
                ),
              ),
            ),
          ),
        ),
        const Divider(
          height: 20,
          color: Colors.transparent,
        ),
        ElevatedButton(
          child: const Text("Enviar", style: TextStyle(color: primaryCollor)),
          style: ElevatedButton.styleFrom(
            primary: secondaryCollor,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}
