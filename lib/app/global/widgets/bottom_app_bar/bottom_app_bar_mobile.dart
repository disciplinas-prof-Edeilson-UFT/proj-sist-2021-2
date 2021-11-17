import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ItemButtomBar extends StatelessWidget {
  const ItemButtomBar({Key? key, required this.icon, required this.text, required this.press})
      : super(key: key);
  final VoidCallback press;
  final Icon icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        IconButton(
          onPressed: () => press(),
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
          children: [
            //as ações dos botões recebem o carrinho por enquanto, onde ainda não temos todas as páginas.  
            ItemButtomBar(icon: Icon(Icons.home), text: "Início", press: () => Modular.to.navigate('/'),),
            ItemButtomBar(icon: Icon(Icons.search), text: "Buscar", press: () => Scaffold.of(context).openEndDrawer(),),
            ItemButtomBar(icon: Icon(Icons.add_to_home_screen_outlined), text: "Pedidos", press: () => Scaffold.of(context).openEndDrawer(),),
            ItemButtomBar(icon: Icon(Icons.account_circle_rounded), text: "Perfil", press: () => Scaffold.of(context).openEndDrawer(),),
            ItemButtomBar(icon: Icon(Icons.shopping_cart_outlined), text: "Carrinho", press: () => Scaffold.of(context).openEndDrawer(),),
          ],
        ),
      ),
    );
  }
}
