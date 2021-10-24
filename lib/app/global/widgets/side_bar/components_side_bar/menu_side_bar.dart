import 'package:flutter/material.dart';
import 'package:pscomidas/app/global/widgets/side_bar/components_side_bar/components_side_bar.dart';

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
              child: const LogoSideBar(),
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
              child: const ListTilePerfil(),
            ),
            Container(
              color: Colors.white,
              width: double.maxFinite,
              height: screen.height * 0.04,
              child: const ClosedButtonShop(),
            ),
          ],
        ),
      ),
    );
  }
}
