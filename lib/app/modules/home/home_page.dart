// ignore_for_file: unnecessary_new

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pscomidas/app/modules/home/home_store.dart';
import 'package:pscomidas/app/modules/home/schemas.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key? key, this.title = "Home"}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeStore> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryCollor,
        elevation: 2,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InkWell(
              child: Image.asset(
                "lib/app/modules/home/assets/logo.png",
                width: MediaQuery.of(context).size.width * 0.2,
              ),
              onTap: () {},
            ),
            InkWell(
              child: Image.asset(
                "lib/app/modules/home/assets/filtro.png",
                width: MediaQuery.of(context).size.width * 0.2,
              ),
              onTap: () {},
            ),
          ],
        ),
        titleSpacing: 0.0,
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Image.asset(
              "lib/app/modules/home/assets/user.png",
            ),
            iconSize: MediaQuery.of(context).size.width * 0.03,
          ),
          IconButton(
            onPressed: () {},
            icon: Image.asset(
              "lib/app/modules/home/assets/carrinho.png",
            ),
            iconSize: MediaQuery.of(context).size.width * 0.03,
          ),
        ],
      ),
      body: Observer(
        builder: (context) => Text('${store.counter}'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          store.increment();
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
