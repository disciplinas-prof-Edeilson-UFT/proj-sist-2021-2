import 'package:flutter/material.dart';
import 'package:pscomidas/app/modules/home/schemas.dart';

class TabletAppBar extends StatelessWidget {
  const TabletAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: 80,
      backgroundColor: primaryCollor,
      elevation: 2,
      title: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            MouseRegion(
              cursor: SystemMouseCursors.click,
              child: GestureDetector(
                child: Image.asset(
                  "assets/images/logo.png",
                  width: MediaQuery.of(context).size.width * 0.2,
                ),
                onTap: () {},
              ),
            ),
            MouseRegion(
              cursor: SystemMouseCursors.click,
              child: GestureDetector(
                child: Image.asset(
                  "assets/images/filter.png",
                  width: MediaQuery.of(context).size.width * 0.04,
                ),
                onTap: () {},
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.01,
            ),
            const Text(
              "Ordem Alfabética",
              style: TextStyle(
                fontSize: 10,
                color: tertiaryCollor,
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0,
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
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.02,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.03,
            ),
            Column(
              children: [
                const Text(
                  "ENTREGAR EM",
                  style: TextStyle(
                    color: tertiaryCollor,
                    fontSize: 12,
                  ),
                  textAlign: TextAlign.left,
                ),
                Row(
                  children: [
                    const Icon(
                      Icons.add_location_outlined,
                      color: secondaryCollor,
                      size: 14,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.001,
                    ),
                    const Text(
                      "Q. 208 Sul, Alameda 10, 202",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 12,
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
      actions: [
        MouseRegion(
          cursor: SystemMouseCursors.click,
          child: GestureDetector(
            child: Image.asset(
              "assets/images/user.png",
              width: MediaQuery.of(context).size.width * 0.02,
            ),
            onTap: () {},
          ),
        ),
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
