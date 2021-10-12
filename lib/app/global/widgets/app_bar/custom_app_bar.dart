import 'package:flutter/material.dart';
import 'package:pscomidas/app/global/widgets/app_bar/components/desktop_app_bar.dart';
import 'package:pscomidas/app/global/widgets/app_bar/components/mobile_app_bar.dart';
import 'package:pscomidas/app/global/widgets/app_bar/components/tablet_app_bar.dart';

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  const CustomAppBar({Key? key}) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(80.0);

  @override
  _CustomAppBarState createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      var width = constraints.maxWidth;

      if (width < 600) {
        return const MobileAppBar();
      } else if (width < 900) {
        return const TabletAppBar();
      } else {
        return const DesktopAppBar();
      }
    });
  }
}
