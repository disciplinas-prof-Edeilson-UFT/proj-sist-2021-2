import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pscomidas/app/modules/category/category_item_component.dart';
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
      body: 
       Column(
        children: [
          Expanded(child: CustomScrollView(
            physics: BouncingScrollPhysics(),
            slivers: [
              SliverToBoxAdapter(
              child: SizedBox(
                height:86,
                child: ListView.builder(
                  itemCount: 7,
                  scrollDirection: Axis.horizontal,
                  physics: BouncingScrollPhysics(),
                  itemBuilder: (BuildContext context, int index){
                    return Padding(
                      padding: EdgeInsets.only(
                        left: index == 0? 16:0,
                        right: index == 20-1? 16: 20
                      ),
                      child: CategoryItemComponent(),
                    
                    );
                  }
                  )
              )
          )
            ],
            )
            )
        ],
      ),
    );
  }
}
