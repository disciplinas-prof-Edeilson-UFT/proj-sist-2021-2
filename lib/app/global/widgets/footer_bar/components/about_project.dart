import 'package:flutter/material.dart';
/*O warning abaixo é suprimido pois ele solicita que seja importada uma biblioteca
qualquer que implemente dart:html. Isso é desnecessário pois apenas html.window.open 
é utilizado aqui.*/
// ignore: avoid_web_libraries_in_flutter
import 'dart:html' as html;

class AboutProject extends StatelessWidget {
  const AboutProject({ 
    Key? key, 
    required this.url, 
    required this.icon,
  }) : super(key: key);

  final String url;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 50,
      child: IconButton(
        onPressed: () {
          html.window.open(url, "_blank");
        },
        icon: Icon(icon),
      ),
    );
  }
}