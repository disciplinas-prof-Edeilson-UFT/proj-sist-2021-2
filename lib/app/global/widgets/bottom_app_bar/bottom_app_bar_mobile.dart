import 'package:flutter/material.dart';

class ItemButtomBar extends StatelessWidget {
  const ItemButtomBar({Key? key, required this.icon, required this.text})
      : super(key: key);
  final Icon icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        IconButton(
          onPressed: () => Scaffold.of(context).openEndDrawer(),
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
      child: SizedBox(
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
    );
  }
}
