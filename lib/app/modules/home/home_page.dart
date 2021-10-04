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
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Counter'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 20),
            child: Text("Lojas", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
          ),
          Observer(
            builder: (context) => LayoutBuilder(
              builder: (context, constraints) {
                if (constraints.maxWidth > 1200) {
                  return const RestaurantColumns(numberOfColumns: 3);//Implementação temporária até encontrarmos solução mais adequada.
                } else if (constraints.maxWidth > 750) {
                  return const RestaurantColumns(numberOfColumns: 2);//Número de colunas alocado conforme tamanho da pag.
                } else {
                  return const RestaurantColumns(numberOfColumns: 1);//Evita overflow.
                }
              },
            ),
          ),
        ],
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
