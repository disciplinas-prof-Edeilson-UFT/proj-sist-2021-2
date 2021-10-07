import 'package:flutter/material.dart';
import 'package:pscomidas/app/modules/home/schemas.dart';

class MobileAppBar extends StatelessWidget {
  const MobileAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: 80,
      backgroundColor: primaryCollor,
      elevation: 2,
      leading: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          MouseRegion(
            cursor: SystemMouseCursors.click,
            child: GestureDetector(
              child: Image.asset(
                "assets/images/filter.png",
                width: MediaQuery.of(context).size.width * 0.08,
              ),
              onTap: () {},
            ),
          ),
        ],
      ),
      title: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  "ENTREGAR EM",
                  style: TextStyle(
                    color: tertiaryCollor,
                    fontSize: 10,
                  ),
                  textAlign: TextAlign.left,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.add_location_outlined,
                      color: secondaryCollor,
                      size: 14,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.002,
                    ),
                    const Text(
                      "Q. 208 Sul, Alameda 10, 202",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 10,
                      ),
                      textAlign: TextAlign.left,
                    ),
                    MouseRegion(
                      cursor: SystemMouseCursors.click,
                      child: GestureDetector(
                        child: const Icon(
                          Icons.keyboard_arrow_down_sharp,
                          color: secondaryCollor,
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
