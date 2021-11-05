import 'package:flutter/material.dart';

class ImageTO extends StatelessWidget {
  const ImageTO({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size screen = MediaQuery.of(context).size;
    return SizedBox(
      width: screen.width * 0.35,
      height: 500,
      child: Image.asset(
        'assets/images/track_order/gps_img2.jpg',
        fit: BoxFit.cover,
      ),
    );
  }
}
