import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pscomidas/app/global/models/enums/filter.dart';
import 'package:pscomidas/app/modules/home/home_page.dart';
import 'package:pscomidas/app/modules/home/schemas.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/material.dart';
import 'package:pscomidas/app/modules/home/store/home_store.dart';

class LogoAppBar extends StatelessWidget {
  const LogoAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        child: Image.asset(
          "assets/images/logo.png",
          width: MediaQuery.of(context).size.width * 0.2,
        ),
        onTap: () => Navigator.push(
            context, MaterialPageRoute(builder: (context) => const HomePage())),
      ),
    );
  }
}

class LocationAppBar extends StatelessWidget {
  const LocationAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
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
            MouseRegion(
              cursor: SystemMouseCursors.click,
              child: GestureDetector(
                child: const Icon(
                  Icons.add_location_outlined,
                  color: secondaryCollor,
                  size: 14,
                ),
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.001,
            ),
            MouseRegion(
              cursor: SystemMouseCursors.click,
              child: GestureDetector(
                child: const Text(
                  "Q. 208 Sul, Alameda 10, 202",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 12,
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
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
    );
  }
}

class UserAppBar extends StatelessWidget {
  const UserAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        child: Image.asset(
          "assets/images/user.png",
          width: MediaQuery.of(context).size.width * 0.02,
        ),
        onTap: () {},
      ),
    );
  }
}
