import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pscomidas/app/global/widgets/app_bar/custom_app_bar.dart';
import 'package:pscomidas/app/global/widgets/bottom_appp_bar/bottom_app_bar_mobile.dart';
import 'package:pscomidas/app/modules/home/components/restaurant_grid.dart';
import 'package:pscomidas/app/modules/home/store/home_store.dart';
import 'package:pscomidas/app/modules/home/components/mais_pedidos.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key? key, this.title = "Home"}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeStore> {
  var deviceWidth = 0.0;

  Widget layoutMobile() {
    if (deviceWidth < 600) {
      return const AppBarButton();
    } else {
      return Container(
        height: 5,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    deviceWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const CustomAppBar(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 20),
              child: Text(
                "Mais pedidos",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Nunito',
                ),
              ),
            ),
            MaisPedidos(),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 20),
              child: Text(
                "Lojas",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Nunito',
                ),
              ),
            ),
            RestaurantGrid(),
          ],
        ),
      ),
      bottomNavigationBar: layoutMobile(),
    );
  }
}
