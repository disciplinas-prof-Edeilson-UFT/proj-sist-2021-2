import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pscomidas/app/global/models/entities/restaurant.dart';
import 'package:pscomidas/app/modules/home/components/restaurant_card.dart';
import 'package:pscomidas/app/modules/home/store/home_store.dart';

//Esta é a página que constrói os cards conforme necessidade.

class RestaurantGrid extends StatefulWidget {
  const RestaurantGrid({Key? key}) : super(key: key);

  @override
  State<RestaurantGrid> createState() => _RestaurantGridState();
}

class _RestaurantGridState extends ModularState<RestaurantGrid, HomeStore> {
  final homeStore = Modular.get<HomeStore>();
  late Restaurant restaurant;

  @override
  void initState() {
    homeStore.getRestaurants();
    WidgetsFlutterBinding.ensureInitialized();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double _pageWidth = MediaQuery.of(context).size.width;
    return Observer(
      builder: (_) {
        var restaurants = homeStore.restaurants;
        if (homeStore.selectedCategory != '') {
          restaurants = restaurants
              .where((e) => e.category.contains(homeStore.selectedCategory))
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
                  : _pageWidth * 0.10, //Responsivo verticalmente (min 100 px)
              childAspectRatio: 3 / 2,
              crossAxisSpacing: 8,
              mainAxisSpacing: 8),
          itemCount: restaurants.length,
          itemBuilder: (context, index) {
            try {
              //lida com erros nos campos dos documentos do firebase.
              //garantido que os documentos serão feitos sem erros, este try catch pode ser excluido.
              restaurant = Restaurant(
                restaurants[index].restaurantId,
                category: restaurants[index].category,
                deliveryPrice: restaurants[index].deliveryPrice,
                distance: restaurants[index].distance,
                estimatedDelivery: restaurants[index].estimatedDelivery,
                image: restaurants[index].image,
                isChampion: restaurants[index].isChampion,
                orders: restaurants[index].orders,
                socialName: restaurants[index].socialName,
                avaliation: restaurants[index].avaliation,
                cupom: restaurants[index].cupom,
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
  }
}
