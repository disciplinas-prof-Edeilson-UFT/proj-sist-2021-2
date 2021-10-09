import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pscomidas/app/global/models/enums/filter.dart';
import 'package:pscomidas/app/modules/home/components/restaurant_card.dart';
import 'package:pscomidas/app/modules/home/store/home_store.dart';

//Esta é a página que busca dados no firebase e constrói os cards conforme necessidade.

class RestaurantGrid extends StatefulWidget {
 const RestaurantGrid ({Key? key ,this.CategoryField})  : super(key: key);
 final String? CategoryField;
  @override
  State<RestaurantGrid> createState() => _RestaurantGridState();
}

class _RestaurantGridState extends ModularState<RestaurantGrid, HomeStore> {
  final homeStore = Modular.get<HomeStore>();

  @override
  Widget build(BuildContext context) {
    
    return Observer(
      builder: (ctx) {
        if(widget.CategoryField == null){
             return StreamBuilder(
          stream:
               FirebaseFirestore.instance
              
              .collection('restaurant')
              .orderBy(
                homeStore.selectedFilter.filterBackEnd,
                descending:
                    homeStore.selectedFilter.filterBackEnd == 'avaliation' ||
                        homeStore.selectedFilter.filterBackEnd == 'cupom',
              )
             
              .snapshots(),
              
          

          builder: (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
            if (streamSnapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }
            
            final restaurants = streamSnapshot.data!.docs;
            double _pageWidth = MediaQuery.of(context).size.width;

            return GridView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: _pageWidth > 1100
                        ? 3
                        : _pageWidth > 700
                            ? 2
                            : 1, //Responsivo horizontalmente
                    mainAxisExtent: _pageWidth * 0.10 < 100
                        ? 100
                        : _pageWidth *
                            0.10, //Responsivo verticalmente (min 100 px)
                    childAspectRatio: 3 / 2,
                    crossAxisSpacing: 8,
                    mainAxisSpacing: 8),
                itemCount: restaurants.length,
                itemBuilder: (context, index) {
                  try {
                    //lida com erros nos campos dos documentos do firebase.
                    //garantido que os documentos serão feitos sem erros, este try catch pode ser excluido.
                    restaurants[index]['image'];
                    restaurants[index]['social_name'];
                    restaurants[index]['avaliation'];
                    restaurants[index]['category'];
                    restaurants[index]['distance'];
                    restaurants[index]['estimated_delivery'];
                    restaurants[index]['delivery_price'];
                    restaurants[index]['cupom'];
                  } catch (exception) {
                    return Column(children: [
                      Text(exception.toString()),
                      const Text(
                        "CONTACTE O GRUPO 1 PARA MAIS DETALHES.",
                        style: TextStyle(color: Colors.red),
                      ),
                    ]);
                  }
                  return RestaurantCard(restaurants[index]);
                });
          },
        );
        }else{
           return StreamBuilder(
          stream:
               FirebaseFirestore.instance
              
              .collection('restaurant')
              .where('category', isEqualTo:widget.CategoryField  )
             
              .snapshots(),
              
  
          builder: (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
            if (streamSnapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }
            
            final restaurants = streamSnapshot.data!.docs;
            double _pageWidth = MediaQuery.of(context).size.width;

            return GridView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: _pageWidth > 1100
                        ? 3
                        : _pageWidth > 700
                            ? 2
                            : 1, //Responsivo horizontalmente
                    mainAxisExtent: _pageWidth * 0.10 < 100
                        ? 100
                        : _pageWidth *
                            0.10, //Responsivo verticalmente (min 100 px)
                    childAspectRatio: 3 / 2,
                    crossAxisSpacing: 8,
                    mainAxisSpacing: 8),
                itemCount: restaurants.length,
                itemBuilder: (context, index) {
                  try {
                    //lida com erros nos campos dos documentos do firebase.
                    //garantido que os documentos serão feitos sem erros, este try catch pode ser excluido.
                    restaurants[index]['image'];
                    restaurants[index]['social_name'];
                    restaurants[index]['avaliation'];
                    restaurants[index]['category'];
                    restaurants[index]['distance'];
                    restaurants[index]['estimated_delivery'];
                    restaurants[index]['delivery_price'];
                    restaurants[index]['cupom'];
                  } catch (exception) {
                    return Column(children: [
                      Text(exception.toString()),
                      const Text(
                        "CONTACTE O GRUPO 1 PARA MAIS DETALHES.",
                        style: TextStyle(color: Colors.red),
                      ),
                    ]);
                  }
                  return RestaurantCard(restaurants[index]);
                });
          },
        );
        }
       
      },
    );
  }
}
