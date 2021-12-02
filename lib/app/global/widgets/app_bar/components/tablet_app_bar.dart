import 'package:flutter_modular/flutter_modular.dart';
import 'package:pscomidas/app/global/widgets/app_bar/components/components_app_bar.dart';
import 'package:pscomidas/app/global/utils/schemas.dart';
import 'package:flutter/material.dart';
import 'package:pscomidas/app/modules/home/store/home_store.dart';

class TabletAppBar extends StatefulWidget implements PreferredSizeWidget {
  const TabletAppBar({Key? key}) : super(key: key);

  @override
  _TabletAppBarState createState() => _TabletAppBarState();

  @override
  Size get preferredSize => const Size.fromHeight(80.0);
}

class _TabletAppBarState extends ModularState<TabletAppBar, HomeStore> {
  @override
  Widget build(BuildContext context) {
    final Size screen = MediaQuery.of(context).size;
    return AppBar(
      toolbarHeight: 80,
      backgroundColor: primaryColor,
      elevation: 2,
      automaticallyImplyLeading: false,
      title: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: const [
            LogoAppBar(),
            FilterAppBar(),
            LocationAppBar(),
          ],
        ),
      ),
      titleSpacing: 0.0,
      centerTitle: false,
      actions: [
        const UserAppBar(),
        SizedBox(
          width: screen.width * 0.03,
        ),
      ],
    );
  }
}
