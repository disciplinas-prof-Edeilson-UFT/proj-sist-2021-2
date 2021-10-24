import 'package:flutter/material.dart';

import 'package:pscomidas/app/modules/home/schemas.dart';

class SideBar extends StatefulWidget {
  const SideBar({Key? key}) : super(key: key);

  @override
  _SideBarState createState() => _SideBarState();
}

class _SideBarState extends State<SideBar> {
  @override
  Widget build(BuildContext context) {
    final Size screen = MediaQuery.of(context).size;

    return Drawer(
      elevation: 0,
      child: Container(
        color: secondaryCollor,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.symmetric(
                vertical: screen.height * 0.05,
              ),
              child: MouseRegion(
                cursor: SystemMouseCursors.click,
                child: GestureDetector(
                  child: Image.asset(
                    "assets/images/logo-primary.png",
                    width: screen.width * 0.1,
                  ),
                  onTap: () =>
                      Navigator.popUntil(context, ModalRoute.withName('/')),
                ),
              ),
            ),
            SizedBox(
              height: screen.height * 0.05,
            ),
            Expanded(
              child: Container(
                margin: EdgeInsets.symmetric(
                  horizontal: screen.height * 0.09,
                ),
                child: ListView(
                  children: <Widget>[
                    const TextButtonMenu(
                      option: "Produtos",
                    ),
                    SizedBox(
                      height: screen.height * 0.05,
                    ),
                    const TextButtonMenu(
                      option: "Pedidos",
                    ),
                    SizedBox(
                      height: screen.height * 0.05,
                    ),
                    const TextButtonMenu(
                      option: "Avaliações",
                    ),
                    SizedBox(
                      height: screen.height * 0.05,
                    ),
                    const TextButtonMenu(
                      option: "Sair",
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: screen.height * 0.3,
            ),
            Container(
              alignment: Alignment.center,
              color: redCollor,
              width: double.maxFinite,
              height: screen.height * 0.1,
              child: ListTile(
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
              ),
            ),
            Container(
              color: Colors.white,
              width: double.maxFinite,
              height: screen.height * 0.04,
              child: MouseRegion(
                cursor: SystemMouseCursors.click,
                child: GestureDetector(
                  // ignore: prefer_const_constructors
                  child: Text(
                    "Fechar loja",
                    style: const TextStyle(
                      color: secondaryCollor,
                      fontSize: 20,
                      fontFamily: "Nunito",
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
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
