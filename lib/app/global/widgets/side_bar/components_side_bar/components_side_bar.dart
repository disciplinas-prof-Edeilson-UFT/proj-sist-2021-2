import 'package:flutter/material.dart';
import 'package:pscomidas/app/modules/home/schemas.dart';

class LogoSideBar extends StatelessWidget {
  const LogoSideBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size screen = MediaQuery.of(context).size;
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        child: Image.asset(
          "assets/images/logo-primary.png",
          width: screen.width * 0.1,
        ),
        onTap: () => Navigator.popUntil(context, ModalRoute.withName('/')),
      ),
    );
  }
}

class TextButtonMenu extends StatelessWidget {
  final String option;
  const TextButtonMenu({Key? key, required this.option}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        child: Text(
          option,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 22,
            fontFamily: "Nunito",
            fontWeight: FontWeight.bold,
          ),
          //textAlign: TextAlign.left,
        ),
      ),
    );
  }
}

class TextButtonMenuMobile extends StatelessWidget {
  final String option;
  const TextButtonMenuMobile({Key? key, required this.option})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        child: Text(
          option,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 12,
            fontFamily: "Nunito",
            fontWeight: FontWeight.bold,
          ),
          //textAlign: TextAlign.left,
        ),
      ),
    );
  }
}

class ListTilePerfil extends StatelessWidget {
  const ListTilePerfil({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      //Aqui será a imagem do Upload (icon de demonstração)
      leading: const Icon(
        Icons.account_circle_sharp,
        color: Colors.white,
        size: 50,
      ),
      title: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: GestureDetector(
          child: const Text(
            "Editar perfil",
            style: TextStyle(
              color: Colors.white,
              fontFamily: "Nunito",
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.left,
          ),
        ),
      ),
      minLeadingWidth: 0,
    );
  }
}

class ListTilePerfilMobile extends StatelessWidget {
  const ListTilePerfilMobile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      //Aqui será a imagem do Upload (icon de demonstração)
      leading: const Icon(
        Icons.account_circle_sharp,
        color: Colors.white,
        size: 20,
      ),
      title: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: GestureDetector(
          child: const Text(
            "Editar perfil",
            style: TextStyle(
              color: Colors.white,
              fontFamily: "Nunito",
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.left,
          ),
        ),
      ),
      minLeadingWidth: 0,
    );
  }
}

class ClosedButtonShop extends StatelessWidget {
  const ClosedButtonShop({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        // ignore: prefer_const_constructors
        child: Text(
          "Fechar loja",
          style: const TextStyle(
            color: secondaryCollor,
            fontSize: 18,
            fontFamily: "Nunito",
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}

class ClosedButtonShopMobile extends StatelessWidget {
  const ClosedButtonShopMobile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        // ignore: prefer_const_constructors
        child: Text(
          "Fechar loja",
          style: const TextStyle(
            color: secondaryCollor,
            fontSize: 12,
            fontFamily: "Nunito",
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
