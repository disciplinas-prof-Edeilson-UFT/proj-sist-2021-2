import 'package:flutter_modular/flutter_modular.dart';
import 'package:pscomidas/app/global/widgets/app_bar/components/components_app_bar.dart';
import 'package:pscomidas/app/global/utils/schemas.dart';
import 'package:flutter/material.dart';
import 'package:pscomidas/app/modules/home/store/home_store.dart';

class DesktopAppBar extends StatefulWidget implements PreferredSizeWidget {
  const DesktopAppBar({Key? key}) : super(key: key);

  @override
  _DesktopAppBarState createState() => _DesktopAppBarState();

  @override
  Size get preferredSize => const Size.fromHeight(80.0);
}

class _DesktopAppBarState extends ModularState<DesktopAppBar, HomeStore> {
  @override
  HomeStore store = Modular.get<HomeStore>();

  @override
  Widget build(BuildContext context) {
    final Size screen = MediaQuery.of(context).size;
    return AppBar(
      toolbarHeight: 80,
      backgroundColor: primaryColor,
      automaticallyImplyLeading: false,
      elevation: 2,
      title: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const LogoAppBar(),
            const FilterAppBar(),
            Center(
              child: SearchArea(),
            ),
            SizedBox(
              width: screen.width * 0.03,
            ),
            const LocationAppBar(),
          ],
        ),
      ),
      titleSpacing: 0.0,
      centerTitle: false,
      actions: [
        const UserAppBar(),
        SizedBox(width: screen.width * 0.02),
        const CartAppBar(),
        SizedBox(
          width: screen.width * 0.03,
        ),
      ],
    );
  }
}
