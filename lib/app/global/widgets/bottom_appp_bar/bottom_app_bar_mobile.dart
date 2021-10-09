import 'package:flutter/material.dart';
import 'package:pscomidas/app/modules/home/home_page.dart';

class ItemButtomBar extends StatelessWidget {
  const ItemButtomBar({Key? key, required this.icon, required this.text})
      : super(key: key);
  final icon;
  final text;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        IconButton(
          onPressed: () {},
          icon: icon,
          iconSize: 15,
        ),
        Text(text),
      ],
    );
  }
}

class AppBarButton extends StatelessWidget {
  const AppBarButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      child: Container(
        height: 80,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: const [
            ItemButtomBar(icon: Icon(Icons.home), text: "Início"),
            ItemButtomBar(icon: Icon(Icons.search), text: "Buscar"),
            ItemButtomBar(
                icon: Icon(Icons.add_to_home_screen_outlined), text: "Pedidos"),
            ItemButtomBar(
                icon: Icon(Icons.account_circle_rounded), text: "Perfil"),
          ],
        ),
      ),
      //fixedColor: Colors.black,
    );
  }
}
