import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';
import 'package:pscomidas/app/global/utils/schemas.dart';
import 'package:pscomidas/app/modules/restaurant_home/restaurant_home_store.dart';
import 'components/desktop_plan.dart';
import 'components/mobile_plan.dart';

class RestaurantPlanPage extends StatefulWidget {
  static String get routeName => '/plans';
  final String title;
  const RestaurantPlanPage({Key? key, this.title = 'RestaurantPlanPage'})
      : super(key: key);
  @override
  RestaurantPlanState createState() => RestaurantPlanState();
}

class RestaurantPlanState extends State<RestaurantPlanPage> {
  final RestaurantHomeStore store = Modular.get<RestaurantHomeStore>();
  @override
  void initState() {
    store.getRestaurantPlan();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 12),
            child: Text(
              "Planos",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                overflow: TextOverflow.ellipsis,
                fontFamily: 'Nunito',
              ),
            ),
          ),
          Expanded(
            child: LayoutBuilder(builder: (context, constraints) {
              if (constraints.maxWidth > 700) {
                return const DesktopPlan();
              } else {
                return const MobilePlan();
              }
            }),
          ),
          Observer(builder: (_) {
            return ElevatedButton(
              style: ButtonStyle(
                splashFactory: NoSplash.splashFactory,
                backgroundColor:
                    MaterialStateProperty.resolveWith(_getButtonColor),
                minimumSize: MaterialStateProperty.all(const Size(210, 48)),
              ),
              onPressed: store.selectedPlan == null
                  ? null
                  : store.selectedPlan == store.actualPlan
                      ? null
                      : store.updatePlan,
              child: const Text(
                'Confirmar',
                style: TextStyle(fontFamily: 'Nunito', fontSize: 18),
              ),
            );
          }),
          const Padding(
            padding: EdgeInsets.only(bottom: 8.0),
            child: Text(
              'Você pode mudar o plano a qualquer momento',
              style: TextStyle(color: Colors.grey),
            ),
          ),
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
