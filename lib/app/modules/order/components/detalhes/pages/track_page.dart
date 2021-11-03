import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:pscomidas/app/global/widgets/app_bar/custom_app_bar.dart';
import 'package:pscomidas/app/modules/cart/cart_page.dart';
import 'package:pscomidas/app/modules/order/components/detalhes/pages/desktop_trackpage.dart';
import 'package:pscomidas/app/modules/order/components/detalhes/pages/mobile_trackpage.dart';

class TrackPage extends StatefulWidget {
  static String trackRouteName = '/Track';
  const TrackPage({Key? key}) : super(key: key);

  @override
  _TrackPageState createState() => _TrackPageState();
}

class _TrackPageState extends State<TrackPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const CustomAppBar(),
      endDrawer: const CartPage(),
      body: LayoutBuilder(
        builder: (context, constraints) {
          var largura = constraints.maxWidth;
          if (largura < 1360) {
            return const MobileTrackPage();
          } else {
            return const DesktopTrackPage();
          }
        },
      ),
    );
  }
}
