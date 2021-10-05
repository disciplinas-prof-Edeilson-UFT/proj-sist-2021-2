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
          //crossAxisAlignment: CrossAxisAlignment.start,
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
                width: MediaQuery.of(context).size.width * 0.03,
              ),
              onTap: () {},
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.01,
            ),
            const Text(
              "Ordem Alfabética",
              style: TextStyle(
                fontSize: 10,
                color: tertiaryCollor,
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0,
            ),
            InkWell(
              child: const Icon(
                Icons.keyboard_arrow_down_sharp,
                color: secondaryCollor,
              ),
              onTap: () {},
            ),
          ],
        ),
        titleSpacing: 0.0,
        centerTitle: false,
        actions: [
          InkWell(
            child: Image.asset(
              "lib/app/modules/home/assets/user.png",
              width: MediaQuery.of(context).size.width * 0.02,
            ),
            onTap: () {},
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.02,
          ),
          InkWell(
            child: Image.asset(
              "lib/app/modules/home/assets/carrinho.png",
              width: MediaQuery.of(context).size.width * 0.02,
            ),
            onTap: () {},
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.02,
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
