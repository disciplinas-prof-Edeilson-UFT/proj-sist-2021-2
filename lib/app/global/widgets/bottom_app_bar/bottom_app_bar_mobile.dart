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
            //o botão de buscar ainda não foi implementado nenhuma ação, por isso recebe apenas um scaffold.   
            ItemButtomBar(icon: const Icon(Icons.home), text: "Início", press: () => Modular.to.navigate('/'),),
            ItemButtomBar(icon: const Icon(Icons.search), text: "Buscar", press: () => Scaffold.of(context),),
            ItemButtomBar(icon: const Icon(Icons.account_circle_rounded), text: "Perfil", press: () =>Modular.to.navigate('/auth'),),
            ItemButtomBar(icon: const Icon(Icons.shopping_cart_outlined), text: "Carrinho", press: () => Scaffold.of(context).openEndDrawer(),),
          ],
        ),
      ),
    );
  }
}
