import 'package:flutter/material.dart';
import 'package:pscomidas/app/modules/restaurant_home/side_bar_components/logout_button.dart';

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
        color: Color(0XFFea1d2c),
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
                    Expanded(
                      child: Container(),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: screen.height * 0.3,
            ),
            LogoutButton(),
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
