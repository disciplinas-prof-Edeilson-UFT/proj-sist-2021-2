import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pscomidas/app/modules/home/components/restaurant_column.dart';
import 'package:pscomidas/app/modules/home/home_store.dart';


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
        title: const Text('Counter'),
      ),
      body: Observer(
        builder: (context) => LayoutBuilder(
          builder: (context, constraints) {
            if (constraints.maxWidth > 1200) {
              return const RestaurantColumns(numberOfColumns: 3);//Implementação temporária para debug.
            } else if (constraints.maxWidth > 750) {
              return const RestaurantColumns(numberOfColumns: 2);//Número de colunas alocado conforme tamanho da pag.
            } else {
              return const RestaurantColumns(numberOfColumns: 1);//Evita overflow.
            }
          },
        ),
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
