import 'package:flutter/material.dart';

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

class _CardProductState extends State<CardProduct> {
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: InkWell(
        child: Image.asset(widget.image, width: 250),
      ),
    );
  }
}

class CardProductAdd extends StatefulWidget {
  const CardProductAdd({
    Key? key,
  }) : super(key: key);
  @override
  _CardProductAddState createState() => _CardProductAddState();
}

class _CardProductAddState extends State<CardProductAdd> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
          color: const Color(0xFFEEEEEE),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          child: InkWell(
            onTap: () {},
            child: const SizedBox(
              width: 250,
              height: 250,
              child: Icon(Icons.add_outlined, size: 55),
            ),
          )),
    );
  }
}

class TextAboveGrid extends StatefulWidget {
  const TextAboveGrid({Key? key}) : super(key: key);

  @override
  _TextAboveGridState createState() => _TextAboveGridState();
}

class _TextAboveGridState extends State<TextAboveGrid> {
  @override
  Widget build(BuildContext context) {
    return const Align(
      alignment: Alignment.topCenter,
      child: Padding(
        padding: EdgeInsets.all(20),
        child: Text(
          "Produtos",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 40,
            overflow: TextOverflow.ellipsis,
            fontFamily: 'Nunito',
          ),
        ),
      ),
    );
  }
}
