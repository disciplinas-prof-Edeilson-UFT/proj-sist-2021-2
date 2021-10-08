import 'package:flutter_modular/flutter_modular.dart';
import 'package:pscomidas/app/global/widgets/app_bar/components/components_app_bar.dart';
import 'package:pscomidas/app/modules/home/schemas.dart';
import 'package:flutter/painting.dart';
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
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: 80,
      backgroundColor: primaryCollor,
      automaticallyImplyLeading: false,
      elevation: 2,
      title: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const LogoAppBar(),
            const FilterAppBar(),
            Center(
              child: Container(
                width: MediaQuery.of(context).size.width * 0.2,
                height: MediaQuery.of(context).size.height * 0.04,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: const TextField(
                  textAlign: TextAlign.left,
                  textAlignVertical: TextAlignVertical.center,
                  decoration: InputDecoration(
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    hintText: "Busque por ítem ou loja",
                    hintStyle: TextStyle(
                      color: tertiaryCollor,
                      fontSize: 14,
                    ),
                    prefixIcon: Icon(
                      Icons.search,
                      color: secondaryCollor,
                      size: 18,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.03,
            ),
            const LocationAppBar(),
          ],
        ),
      ),
      titleSpacing: 0.0,
      centerTitle: false,
      actions: [
        const UserAppBar(),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.02,
        ),
        MouseRegion(
          cursor: SystemMouseCursors.click,
          child: GestureDetector(
            child: Image.asset(
              "assets/images/cart.png",
              width: MediaQuery.of(context).size.width * 0.02,
            ),
            onTap: () {},
          ),
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.03,
        ),
      ],
    );
  }
}
