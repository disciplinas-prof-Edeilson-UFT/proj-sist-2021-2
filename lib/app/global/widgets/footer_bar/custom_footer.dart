import 'package:flutter/material.dart';
import 'package:flutter_signin_button/button_list.dart';
import 'package:pscomidas/app/global/widgets/footer_bar/components/desktop_footer_bar.dart';
import 'package:pscomidas/app/global/widgets/footer_bar/components/mobile_footer_bar.dart';
import 'package:pscomidas/app/global/widgets/footer_bar/components/tablet_footer_bar.dart';
import 'package:pscomidas/app/modules/restaurant_home/pages/product/product_page.dart';
import 'package:pscomidas/app/modules/restaurant_home/restaurant_home_module.dart';
import 'package:pscomidas/app/modules/restaurant_register/restaurant_register_module.dart';
import 'package:pscomidas/app/modules/restaurant_register/restaurant_register_page.dart';

class CustomFooter extends StatefulWidget {
  const CustomFooter({Key? key}) : super(key: key);

  @override
  _CustomFooterState createState() => _CustomFooterState();
}

class _CustomFooterState extends State<CustomFooter> {
  final List<String> ifood = [
    'Site institucional',
    'Fale conosco',
    'Carreiras',
    'ifood Colômbia'
  ];
  final List<String> descubra = [
    'Cadastre seu Restaurante ou Mercado',
    'iFood Shop',
    'iFood Card',
    'iFood Empresas'
  ];
  final List<String> navigator = [
    RestaurantRegisterModule.routeName + RestaurantRegisterPage.routeName,
    '',
    '',
    RestaurantHomeModule.routeName + ProductPage.routeName,
  ];
  final List<Buttons> social = [Buttons.Facebook, Buttons.Twitter];
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      var width = constraints.maxWidth;
      if (width < 600) {
        return MobileFooterBar(
          ifood: ifood,
          descubra: descubra,
          social: social,
        );
      } else if (width < 1000) {
        return TabletFooterBar(
          ifood: ifood,
          descubra: descubra,
          social: social,
        );
      } else {
        return DesktopCustomFooter(
          ifood: ifood,
          descubra: descubra,
          social: social,
          navigator: navigator,
        );
      }
    });
  }
}
