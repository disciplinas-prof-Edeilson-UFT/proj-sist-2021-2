import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';
import 'components/register_card.dart';
import 'register_store.dart';

class RestaurantRegisterPage extends StatefulWidget {
  final String title;
  const RestaurantRegisterPage({Key? key, this.title = 'RestaurantRegisterPage'}) : super(key: key);
  @override
  RestaurantRegisterPageState createState() => RestaurantRegisterPageState();
}

class RestaurantRegisterPageState extends State<RestaurantRegisterPage> {
  final RestaurantRegisterStore store = Modular.get();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text('conquiste mais clientes etc'),
              RegisterCard(),
            ],
          ),
        ],
      ),
    );
  }
}
