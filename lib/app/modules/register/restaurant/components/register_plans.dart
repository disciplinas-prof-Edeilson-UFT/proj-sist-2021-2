import 'package:flutter/material.dart';

class RegisterPlans extends StatelessWidget {
  const RegisterPlans({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
        child: pagePlansResponsivity(MediaQuery.of(context).size.width),
      ),
    );
  }
}

class Card extends StatefulWidget {
  const Card({Key? key, required this.image, this.colorBox}) : super(key: key);
  final String image;
  final colorBox;
  @override
  _CardState createState() => _CardState();
}

class _CardState extends State<Card> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 400.0,
      height: 500.0,
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: widget.colorBox,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      blurRadius: 7.0, // soften the shadow
                      spreadRadius: 5.0, //extend the shadow
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: FittedBox(
                  child: Image.asset(
                    widget.image,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget pagePlansResponsivity(width) {
  if (width > 850) {
    return SingleChildScrollView(
      controller: ScrollController(initialScrollOffset: 0.0),
      scrollDirection: Axis.horizontal,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 200,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Card(
                image: "assets/images/cards/whitebackground.png",
                colorBox: Colors.white),
            Card(
                image: "assets/images/cards/redbackground.png",
                colorBox: Colors.red.shade900),
          ],
        ),
      ),
    );
  }
  return SingleChildScrollView(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Column(
          children: [
            const Card(
                image: "assets/images/cards/whitebackground.png",
                colorBox: Colors.white),
            Card(
                image: "assets/images/cards/redbackground.png",
                colorBox: Colors.red.shade900),
          ],
        ),
      ],
    ),
  );
}
