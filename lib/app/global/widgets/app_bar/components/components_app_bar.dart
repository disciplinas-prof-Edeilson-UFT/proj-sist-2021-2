import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pscomidas/app/global/models/enums/filter.dart';
import 'package:pscomidas/app/global/widgets/app_bar/components/user_profile_options.dart';
import 'package:pscomidas/app/global/utils/schemas.dart';
import 'package:pscomidas/app/modules/auth/auth_module.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/material.dart';
import 'package:pscomidas/app/modules/home/store/home_store.dart';
import 'package:pscomidas/app/modules/register_client/register_client_module.dart';

class LogoAppBar extends StatelessWidget {
  const LogoAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size screen = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40.0),
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: GestureDetector(
          child: Image.asset(
            "assets/images/logo.png",
            width: screen.width * 0.08,
          ),
          onTap: () => Modular.to.navigate('/'),
        ),
      ),
    );
  }
}

class FilterAppBar extends StatefulWidget {
  const FilterAppBar({Key? key}) : super(key: key);

  @override
  _FilterAppBarState createState() => _FilterAppBarState();
}

class _FilterAppBarState extends ModularState<FilterAppBar, HomeStore> {
  final homeStore = Modular.get<HomeStore>();

  @override
  Widget build(BuildContext context) {
    final Size screen = MediaQuery.of(context).size;
    return Row(
      children: [
        Observer(
          builder: (ctx) => DropdownButton<String>(
            value: homeStore.selectedFilter.filterFrontEnd,
            onChanged: homeStore.setSelectedFilter,
            elevation: 2,
            underline: Container(),
            style: const TextStyle(
              fontSize: 12,
              color: tertiaryColor,
            ),
            items: FilterType.values
                .map<DropdownMenuItem<String>>((value) =>
                    DropdownMenuItem<String>(
                      value: value.filterFrontEnd,
                      child: Row(
                        children: [
                          Padding(
                            child: Image.asset(
                              'assets/images/filters/' + value.image + '.png',
                              width: screen.width * 0.04,
                            ),
                            padding: EdgeInsets.only(
                              right: screen.width * 0.01,
                            ),
                          ),
                          Text(value.filterFrontEnd),
                        ],
                      ),
                    ))
                .toList(),
            icon: const Icon(
              Icons.keyboard_arrow_down_sharp,
              color: secondaryColor,
            ),
          ),
        ),
        SizedBox(
          width: screen.width * 0.02,
        ),
      ],
    );
  }
}

class LocationAppBar extends StatelessWidget {
  const LocationAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size screen = MediaQuery.of(context).size;
    return Column(
      children: [
        const Text(
          "ENTREGAR EM",
          style: TextStyle(
            color: tertiaryColor,
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
                  color: secondaryColor,
                  size: 14,
                ),
              ),
            ),
            SizedBox(
              width: screen.width * 0.001,
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
                  color: secondaryColor,
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

class RegisterButton extends StatelessWidget {
  const RegisterButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(
        Icons.edit_outlined,
        color: Colors.red,
        size: 30,
      ),
      onPressed: () {
        Modular.to.navigate(RegisterClientModule.routeName);
      },
    );
  }
}

class UserAppBar extends StatefulWidget {
  const UserAppBar({Key? key}) : super(key: key);

  @override
  State<UserAppBar> createState() => _UserAppBarState();
}

class _UserAppBarState extends State<UserAppBar> {
  final bool logged = FirebaseAuth.instance.currentUser != null ? true : false;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return logged
        ? PopupMenuButton(
            icon: const Icon(
              Icons.person_outline_outlined,
              color: Colors.red,
            ),
            iconSize: 30.0,
            offset: const Offset(-5, 60),
            itemBuilder: (_) => UserProfileOptions.listy,
          )
        : IconButton(
            icon: const Icon(
              Icons.login,
              color: Colors.red,
              size: 30,
            ),
            onPressed: () {
              FirebaseAuth.instance.signOut();
              Modular.to.navigate(AuthModule.routeName);
            },
          );
  }
}

class ItemMenuHover extends StatefulWidget {
  const ItemMenuHover({Key? key, required this.title, required this.icon})
      : super(key: key);
  final String title;
  final IconData icon;

  @override
  _ItemMenuHoverState createState() => _ItemMenuHoverState();
}

class _ItemMenuHoverState extends State<ItemMenuHover> {
  Color color = Colors.black54;
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onHover: (_) {
        setState(() {
          color = Colors.red;
        });
      },
      onExit: (_) {
        setState(() {
          color = Colors.black54;
        });
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 15.0,
              vertical: 8.0,
            ),
            child: Icon(
              widget.icon,
              color: color,
            ),
          ),
          Expanded(
            child: Text(
              widget.title,
              textAlign: TextAlign.left,
              style: TextStyle(color: color),
            ),
          ),
        ],
      ),
    );
  }
}

class CartAppBar extends StatelessWidget {
  const CartAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      icon: const Icon(
        Icons.shopping_cart_outlined,
        size: 30,
      ),
      color: Colors.red,
      hoverColor: Colors.transparent,
      onPressed: () {
        Scaffold.of(context).openEndDrawer();
      },
    );
  }
}
