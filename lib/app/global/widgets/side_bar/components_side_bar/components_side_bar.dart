import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:pscomidas/app/global/utils/schemas.dart';
import 'package:pscomidas/app/modules/restaurant_home/components/restaurant_dialog.dart';
import 'package:pscomidas/app/modules/restaurant_home/components/update_profile/restaurant_profile_picture.dart';
import 'package:pscomidas/app/modules/restaurant_home/restaurant_home_store.dart';

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

class SignOut extends StatelessWidget {
  const SignOut({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        child: const Text(
          'Sair',
          style: TextStyle(
            color: Colors.white,
            fontSize: 22,
            fontFamily: "Nunito",
            fontWeight: FontWeight.bold,
          ),
        ),
        onTap: () async {
          FirebaseAuth.instance.signOut();
          Modular.to.navigate('/');
        },
      ),
    );
  }
}

class SignOutMobile extends StatelessWidget {
  const SignOutMobile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        child: const Text(
          'Sair',
          style: TextStyle(
            color: Colors.white,
            fontSize: 12,
            fontFamily: "Nunito",
            fontWeight: FontWeight.bold,
          ),
        ),
        onTap: () async {
          FirebaseAuth.instance.signOut();
          Modular.to.navigate('/');
        },
      ),
    );
  }
}

class TextButtonMenuMobile extends StatelessWidget {
  final String option;
  final String navigator;
  const TextButtonMenuMobile(
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
            fontSize: 12,
            fontFamily: "Nunito",
            fontWeight: FontWeight.bold,
          ),
        ),
        onTap: () => Modular.to.navigate(navigator),
      ),
    );
  }
}

class ListTilePerfil extends StatelessWidget {
  ListTilePerfil({Key? key}) : super(key: key);
  final RestaurantHomeStore restaurantHomeStore =
      Modular.get<RestaurantHomeStore>();
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        showDialog(
          context: context,
          builder: (_) {
            restaurantHomeStore.updateProfileControllers();
            return const RestaurantDialog();
          },
        );
      },
      leading: RestaurantProfilePicture(),
      title: visualEditInfo(context),
      minLeadingWidth: 0,
    );
  }

  Widget visualEditInfo(context) {
    double _pageWidth = MediaQuery.of(context).size.width;
    if (_pageWidth < 850) {
      return const Icon(
        Icons.create_outlined,
        color: primaryColor,
      );
    } else {
      return Text(
        "Editar perfil",
        style: TextStyle(
          color: Colors.white,
          fontFamily: "Nunito",
          fontSize: _pageWidth < 1000 ? 15 : 20,
          fontWeight: FontWeight.bold,
        ),
        textAlign: TextAlign.left,
      );
    }
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
              color: secondaryColor,
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
              color: secondaryColor,
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
