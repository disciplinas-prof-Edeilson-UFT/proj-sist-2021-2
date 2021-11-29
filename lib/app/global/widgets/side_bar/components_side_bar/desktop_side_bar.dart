import 'package:flutter/material.dart';
import 'package:pscomidas/app/global/widgets/side_bar/components_side_bar/buttons_side_bar.dart';
import 'package:pscomidas/app/global/widgets/side_bar/components_side_bar/components_side_bar.dart';
import 'package:pscomidas/app/modules/home/schemas.dart';

class SideBarDesktop extends StatefulWidget {
  const SideBarDesktop({Key? key}) : super(key: key);

  @override
  _SideBarDesktopState createState() => _SideBarDesktopState();
}

class _SideBarDesktopState extends State<SideBarDesktop> {
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
            Expanded(
              child: Container(
                margin: EdgeInsets.symmetric(
                  horizontal: screen.height * 0.09,
                ),
                child: Column(
                  children: [
                    ...ButtonSideBar.buttons.keys.map(
                      (e) => Column(
                        children: [
                          TextButtonMenu(
                            option: e,
                            navigator: ButtonSideBar.buttons[e]?['navigator']
                                    .toString() ??
                                "/",
                          ),
                          SizedBox(
                            height: screen.height * 0.05,
                          ),
                        ],
                      ),
                    ),
                    const SignOut(),
                  ],
                ),
              ),
            ),
            Container(
              alignment: Alignment.center,
              color: redCollor,
              width: double.maxFinite,
              height: screen.height * 0.1,
              child: ListTilePerfil(),
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
