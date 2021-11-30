import 'package:flutter/material.dart';
import 'package:pscomidas/app/global/widgets/side_bar/components_side_bar/desktop_side_bar.dart';
import 'package:pscomidas/app/global/widgets/side_bar/components_side_bar/mobile_side_bar.dart';
import 'package:pscomidas/app/global/widgets/side_bar/components_side_bar/tablet_side_bar.dart';

class CustomSideBar extends StatefulWidget implements PreferredSizeWidget {
  const CustomSideBar({Key? key}) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(80.0);

  @override
  _CustomSideBarState createState() => _CustomSideBarState();
}

class _CustomSideBarState extends State<CustomSideBar> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      var width = constraints.maxWidth;

      if (width < 200) {
        return const SideBarMobile();
      } else if (width < 100) {
        return const SideBarTablet();
      } else {
        return const SideBarDesktop();
      }
    });
  }
}
