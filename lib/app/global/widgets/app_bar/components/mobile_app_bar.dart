import 'package:pscomidas/app/global/widgets/app_bar/components/components_app_bar.dart';
import 'package:pscomidas/app/modules/home/store/home_store.dart';
import 'package:pscomidas/app/global/utils/schemas.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';

class MobileAppBar extends StatefulWidget implements PreferredSizeWidget {
  const MobileAppBar({Key? key}) : super(key: key);

  @override
  _MobileAppBarState createState() => _MobileAppBarState();

  @override
  Size get preferredSize => const Size.fromHeight(80.0);
}

class _MobileAppBarState extends ModularState<MobileAppBar, HomeStore> {
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
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const FilterAppBar(),
            Column(
              children: [
                const Text(
                  "ENTREGAR EM",
                  style: TextStyle(
                    color: tertiaryColor,
                    fontSize: 8,
                  ),
                  textAlign: TextAlign.left,
                ),
                Row(
                  children: [
                    const Icon(
                      Icons.add_location_outlined,
                      color: secondaryColor,
                      size: 14,
                    ),
                    SizedBox(
                      width: screen.width * 0.001,
                    ),
                    const Text(
                      "Q. 208 Sul, Alameda 10, 202",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 8,
                      ),
                      textAlign: TextAlign.left,
                    ),
                    MouseRegion(
                      cursor: SystemMouseCursors.click,
                      child: GestureDetector(
                        child: const Icon(
                          Icons.keyboard_arrow_down_sharp,
                          color: secondaryColor,
                        ),
                        onTap: () {},
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
      titleSpacing: 0.0,
      centerTitle: false,
    );
  }
}
