import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pscomidas/app/global/models/entities/new_card.dart';
import 'package:pscomidas/app/modules/cart/cart_store.dart';

class CardBuilder extends StatefulWidget {
  final NewCard model;
  const CardBuilder({
    Key? key,
    required this.model,
  }) : super(key: key);

  @override
  _CardBuilderState createState() => _CardBuilderState();
}

class _CardBuilderState extends State<CardBuilder> {
  final CartStore store = Modular.get();
  @override
  Widget build(BuildContext context) {
    String lastDigitCard = widget.model.fourLastNumbers
        .substring(widget.model.fourLastNumbers.length - 4);
    return ElevatedButton(
      onPressed: () {
        store.cadastroTeste();
      },
      style: ElevatedButton.styleFrom(
        primary: Colors.white,
      ),
      child: Container(
        margin: const EdgeInsets.symmetric(
          vertical: 5,
          horizontal: 5,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              widget.model.nickname,
              style: const TextStyle(
                  fontFamily: 'Ninoto',
                  fontSize: 16,
                  color: Color(0xff000000),
                  fontWeight: FontWeight.w600),
            ),
            Text(
              '****.' + lastDigitCard,
              style: const TextStyle(
                  fontFamily: 'Ninoto',
                  fontSize: 16,
                  color: Color(0xff000000),
                  fontWeight: FontWeight.w700),
            ),
            Text(
              widget.model.valid,
              style: const TextStyle(
                  fontFamily: 'Ninoto',
                  fontSize: 16,
                  color: Color(0xff000000),
                  fontWeight: FontWeight.w600),
            )
          ],
        ),
      ),
    );
  }
}
