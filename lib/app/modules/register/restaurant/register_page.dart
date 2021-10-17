import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';
import 'package:pscomidas/app/global/widgets/app_bar/components/components_app_bar.dart';
import 'components/register_card.dart';
import 'register_store.dart';

class RestaurantRegisterPage extends StatefulWidget {
  final String title;
  const RestaurantRegisterPage(
      {Key? key, this.title = 'RestaurantRegisterPage'})
      : super(key: key);
  @override
  RestaurantRegisterPageState createState() => RestaurantRegisterPageState();
}

class RestaurantRegisterPageState extends State<RestaurantRegisterPage> {
  final RestaurantRegisterStore store = Modular.get();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        backgroundColor: const Color(0XFFf7f7f7),
        automaticallyImplyLeading: false,
        elevation: 2,
        title: const Center(child: LogoAppBar()),
      ),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Text('conquiste mais clientes etc'),
                RegisterCard(),
              ],
            ),
          ],
        ),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage("https://i.imgur.com/E4gjwlQ.png"),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
