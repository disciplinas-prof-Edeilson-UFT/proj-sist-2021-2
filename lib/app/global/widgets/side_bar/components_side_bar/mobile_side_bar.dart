import 'package:flutter/material.dart';
import 'package:pscomidas/app/global/utils/schemas.dart';
import 'package:pscomidas/app/global/widgets/side_bar/components_side_bar/buttons_side_bar.dart';
import 'package:pscomidas/app/global/widgets/side_bar/components_side_bar/components_side_bar.dart';

class SideBarMobile extends StatefulWidget {
  const SideBarMobile({Key? key}) : super(key: key);

  @override
  _SideBarMobileState createState() => _SideBarMobileState();
}

class _SideBarMobileState extends State<SideBarMobile> {
  @override
  Widget build(BuildContext context) {
    final Size screen = MediaQuery.of(context).size;

    return Drawer(
      elevation: 0,
      child: Container(
        color: secondaryColor,
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
                  horizontal: screen.height * 0.02,
                ),
                child: Column(
                  children: [
                    ...ButtonSideBar.buttons.keys.map(
                      (e) => Column(
                        children: [
                          TextButtonMenuMobile(
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
                    const SignOutMobile(),
                  ],
                ),
              ),
            ),
            Container(
              alignment: Alignment.center,
              color: redColor,
              width: double.maxFinite,
              height: screen.height * 0.1,
              child: ListTilePerfil(),
            ),
            Container(
              color: Colors.white,
              width: double.maxFinite,
              height: screen.height * 0.04,
              child: const ClosedButtonShopMobile(),
            ),
          ],
        ),
      ),
    );
  }
}
