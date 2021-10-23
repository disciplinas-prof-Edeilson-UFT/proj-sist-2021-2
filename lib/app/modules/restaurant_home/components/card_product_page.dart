import 'package:flutter/material.dart';
import 'package:pscomidas/app/modules/home/schemas.dart';

class CardProduct extends StatefulWidget {
  const CardProduct({
    Key? key,
    required this.image,
  }) : super(key: key);
  final String image;
  // final String? nameOfProduct;
  @override
  _CardProductState createState() => _CardProductState();
}

// ignore: camel_case_types
class _CardProductState extends State<CardProduct> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        MouseRegion(
          cursor: SystemMouseCursors.click,
          child: InkWell(
            child: Image.asset(widget.image, width: 250),
          ),
        ),
      ],
    );
  }
}

class CardProductAdd extends StatefulWidget {
  const CardProductAdd({
    Key? key,
  }) : super(key: key);

  // final String? nameOfProduct;
  @override
  _CardProductAddState createState() => _CardProductAddState();
}

// ignore: camel_case_types
class _CardProductAddState extends State<CardProductAdd> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        MouseRegion(
          cursor: SystemMouseCursors.click,
          child: InkWell(
            child: Icon(Icons.add_circle_outline,
                color: secondaryCollor, size: 36),
          ),
        ),
      ],
    );
  }
}
