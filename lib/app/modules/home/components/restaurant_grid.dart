import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pscomidas/app/global/models/entities/restaurant.dart';
import 'package:pscomidas/app/global/models/enums/filter.dart';
import 'package:pscomidas/app/modules/home/components/restaurant_card.dart';
import 'package:pscomidas/app/modules/home/store/home_store.dart';

//Esta é a página que busca dados no firebase e constrói os cards conforme necessidade.

class RestaurantGrid extends StatefulWidget {
  const RestaurantGrid({Key? key}) : super(key: key);

  @override
  State<RestaurantGrid> createState() => _RestaurantGridState();
}

class _RestaurantGridState extends ModularState<RestaurantGrid, HomeStore> {
  final homeStore = Modular.get<HomeStore>();
  late Restaurant restaurant;
  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (ctx) {
        return StreamBuilder(
          stream: FirebaseFirestore.instance
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

            double _pageWidth = MediaQuery.of(context).size.width;

            return Observer(
              builder: (_) {
                var restaurants = streamSnapshot.data!.docs;
                if (homeStore.selectedCategory != null) {
                  restaurants = restaurants
                      .where((e) => e['category'] == homeStore.selectedCategory)
                      .toList();
                }
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
                      restaurant = Restaurant(
                        restaurants[index].id,
                        category: restaurants[index]['category'] ?? '',
                        deliveryPrice:
                            restaurants[index]['delivery_price'] ?? 0,
                        distance: restaurants[index]['distance'] ?? 0,
                        estimatedDelivery:
                            restaurants[index]['estimated_delivery'] ?? '',
                        image: restaurants[index]['image'] ?? '',
                        isChampion: restaurants[index]['isChampion'] ?? false,
                        orders: restaurants[index]['orders'] ?? 0,
                        socialName: restaurants[index]['social_name'] ?? '',
                        avaliation: restaurants[index]['avaliation'] ?? 0,
                        cupom: restaurants[index]['cupom'],
                      );
                    } catch (exception) {
                      return Column(children: [
                        Text(exception.toString()),
                        const Text(
                          "CONTACTE O GRUPO 1 PARA MAIS DETALHES.",
                          style: TextStyle(color: Colors.red),
                        ),
                      ]);
                    }
                    return RestaurantCard(restaurant);
                  },
                );
              },
            );
          },
        );
      },
    );
  }
}
