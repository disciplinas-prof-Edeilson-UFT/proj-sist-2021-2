import 'package:flutter/material.dart';
import 'package:pscomidas/app/global/widgets/footer_bar/components/desktop_footer_bar.dart';
import 'package:pscomidas/app/global/widgets/footer_bar/components/mobile_footer_bar.dart';
import 'package:pscomidas/app/global/widgets/footer_bar/components/tablet_footer_bar.dart';

class CustomFooter extends StatefulWidget {
  const CustomFooter({Key? key}) : super(key: key);

  @override
  _CustomFooterState createState() => _CustomFooterState();
}

class _CustomFooterState extends State<CustomFooter> {
  final List<String> ifood = [
    'Fale conosco',
  ];
  final List<String> descubra = [
    'Cadastre seu Restaurante ou Mercado',
    'Psfood Empresas'
  ];
  /*final List<String> navigator = [
    RestaurantRegisterModule.routeName + RestaurantRegisterPage.routeName,
    '',
    '',
    RestaurantHomeModule.routeName + ProductPage.routeName,
  ];*/

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      var width = constraints.maxWidth;
      if (width < 720) {
        return MobileFooterBar(
          ifood: ifood,
          descubra: descubra,
        );
      } else if (width < 1250) {
        return TabletFooterBar(
          ifood: ifood,
          descubra: descubra,
        );
      } else {
        return DesktopCustomFooter(
          ifood: ifood,
          descubra: descubra,

          //navigator: navigator,
        );
      }
    });
  }
}
