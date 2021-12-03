import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';
import 'package:pscomidas/app/global/utils/schemas.dart';
import 'package:pscomidas/app/modules/restaurant_home/restaurant_home_store.dart';

import 'components/desktop_cupom.dart';
import 'components/mobile_cupom.dart';

class CupomPage extends StatefulWidget {
  static String get routeName => '/cupons';
  final String title;
  const CupomPage({Key? key, this.title = 'Cupons Page'}) : super(key: key);
  @override
  CupomPageState createState() => CupomPageState();
}

class CupomPageState extends State<CupomPage> {
  final RestaurantHomeStore store = Modular.get<RestaurantHomeStore>();
  @override
  void initState() {
    store.getRestaurantCupom();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 12),
            child: Text(
              "Cupons",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                overflow: TextOverflow.ellipsis,
                fontFamily: 'Nunito',
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 36),
            child: Text(
              "Selecione abaixo o cupom que deseja aplicar:",
              style: TextStyle(
                fontSize: 20,
                overflow: TextOverflow.ellipsis,
                fontFamily: 'Nunito',
              ),
            ),
          ),
          Expanded(
            child: LayoutBuilder(builder: (context, constraints) {
              if (constraints.maxWidth > 800) {
                return const DesktopCupom();
              } else {
                return const MobilePlan();
              }
            }),
          ),
          Observer(builder: (_) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                style: ButtonStyle(
                  splashFactory: NoSplash.splashFactory,
                  backgroundColor:
                      MaterialStateProperty.resolveWith(_getButtonColor),
                  minimumSize: MaterialStateProperty.all(const Size(210, 48)),
                ),
                onPressed: store.selectedCupom == null
                    ? null
                    : store.selectedCupom == store.actualCupom
                        ? null
                        : store.updateCupom,
                child: const Text(
                  'Confirmar',
                  style: TextStyle(fontFamily: 'Nunito', fontSize: 18),
                ),
              ),
            );
          }),
        ],
      ),
    );
  }

  Color _getButtonColor(Set<MaterialState> states) {
    if (states.any((e) => e == MaterialState.pressed)) {
      return const Color(0xffA31922);
    } else if (states.any((e) => e == MaterialState.disabled)) {
      return tertiaryColor;
    }
    return secondaryColor;
  }
}
