import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:pscomidas/app/global/utils/schemas.dart';
import 'package:pscomidas/app/modules/home/schemas.dart';
import 'package:pscomidas/app/modules/restaurant_home/restaurant_home_store.dart';
import 'package:pscomidas/app/modules/restaurant_home/components/update_profile/profile_alert_dialog.dart';

class LogoSideBar extends StatelessWidget {
  const LogoSideBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size screen = MediaQuery.of(context).size;
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        child: Image.asset(
          "assets/images/logo-primary.png",
          width: screen.width * 0.1,
        ),
        onTap: () => Modular.to.navigate('/'),
      ),
    );
  }
}

class TextButtonMenu extends StatelessWidget {
  final String option;
  final String navigator;
  const TextButtonMenu(
      {Key? key, required this.option, required this.navigator})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        child: Text(
          option,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 22,
            fontFamily: "Nunito",
            fontWeight: FontWeight.bold,
          ),
        ),
        onTap: () => Modular.to.navigate(navigator),
      ),
    );
  }
}

class TextButtonMenuMobile extends StatelessWidget {
  final String option;
  final VoidCallback press;
  const TextButtonMenuMobile(
      {Key? key, required this.option, required this.press})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        child: Text(
          option,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 12,
            fontFamily: "Nunito",
            fontWeight: FontWeight.bold,
          ),
        ),
        onTap: press,
      ),
    );
  }
}

class ListTilePerfil extends StatelessWidget {
  ListTilePerfil({Key? key}) : super(key: key);
  final RestaurantHomeStore restaurantHomeStore = Modular.get<RestaurantHomeStore>();
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Observer(
        builder: (_) {
          return CircleAvatar(
            backgroundImage: NetworkImage(restaurantHomeStore.picture),
            backgroundColor: secondaryColor,
          );
        }
      ),
      title: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: GestureDetector(
          onTap: () {
            showDialog(context: context, builder: (_) => ProfileAlertDialog());
          },
          child: const Text(
            "Editar perfil",
            style: TextStyle(
              color: Colors.white,
              fontFamily: "Nunito",
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.left,
          ),
        ),
      ),
      minLeadingWidth: 0,
    );
  }
}

class ListTilePerfilMobile extends StatelessWidget {
  ListTilePerfilMobile({Key? key}) : super(key: key);
  final RestaurantHomeStore restaurantHomeStore = Modular.get<RestaurantHomeStore>();
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Observer(
        builder: (_) {
          return CircleAvatar(
            backgroundImage: NetworkImage(restaurantHomeStore.picture),
            backgroundColor: secondaryColor,
          );
        }
      ),
      title: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: GestureDetector(
          onTap: () {
            showDialog(context: context, builder: (_) => ProfileAlertDialog());
          },
          child: const Text(
            "Editar perfil",
            style: TextStyle(
              color: Colors.white,
              fontFamily: "Nunito",
              fontSize: 9,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.left,
          ),
        ),
      ),
      minLeadingWidth: 0,
    );
  }
}

class ClosedButtonShop extends StatefulWidget {
  const ClosedButtonShop({Key? key}) : super(key: key);

  @override
  _ClosedButtonShopState createState() => _ClosedButtonShopState();
}

class _ClosedButtonShopState extends State<ClosedButtonShop> {
  final RestaurantHomeStore store = RestaurantHomeStore();

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        child: Observer(
          builder: (_) => Text(
            store.toggleText,
            style: const TextStyle(
              color: secondaryCollor,
              fontSize: 18,
              fontFamily: "Nunito",
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        onTap: store.toggleOpen,
      ),
    );
  }
}

class ClosedButtonShopMobile extends StatefulWidget {
  const ClosedButtonShopMobile({Key? key}) : super(key: key);

  @override
  _ClosedButtonShopMobileState createState() => _ClosedButtonShopMobileState();
}

class _ClosedButtonShopMobileState extends State<ClosedButtonShopMobile> {
  final RestaurantHomeStore store = RestaurantHomeStore();

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        child: Observer(
          builder: (_) => Text(
            store.toggleText,
            style: const TextStyle(
              color: secondaryCollor,
              fontSize: 12,
              fontFamily: "Nunito",
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        onTap: store.toggleOpen,
      ),
    );
  }
}
