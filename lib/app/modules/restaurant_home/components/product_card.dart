import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({Key? key, required this.image}) : super(key: key);
  final String image;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: Image.asset(image, width: 250),
    );
  }
}

Widget addProduct() {
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
      ),
    ),
  );
}
