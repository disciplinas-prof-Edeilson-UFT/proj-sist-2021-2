import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pscomidas/app/global/models/entities/restaurant.dart';
import 'package:pscomidas/app/modules/home/store/home_store.dart';
import 'package:pscomidas/app/modules/restaurant/restaurant_module.dart';

class MostOrdered extends StatefulWidget {
  const MostOrdered({Key? key}) : super(key: key);

  @override
  State<MostOrdered> createState() => _MostOrderedState();
}

class _MostOrderedState extends State<MostOrdered> {
  final HomeStore store = Modular.get<HomeStore>();
  List<Restaurant> restaurants = [];

  @override
  initState() {
    WidgetsFlutterBinding.ensureInitialized();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (context) {
      restaurants = store.restaurants.toList();
      restaurants.sort((a, b) => b.orders.compareTo(a.orders));
      return Center(
        child: Padding(
          padding: const EdgeInsets.only(bottom: 16.0),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            height: 150.0,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: restaurants.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: SizedBox(
                    width: 135.0,
                    child: MouseRegion(
                      cursor: SystemMouseCursors.click,
                      child: GestureDetector(
                        onTap: () {
                          Modular.to.navigate(
                            RestaurantModule.routeName,
                            arguments: restaurants[index],
                          );
                        },
                        child: Column(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(bottom: 20.0),
                              child: CircleAvatar(
                                radius: 45.0,
                                backgroundImage:
                                    NetworkImage(restaurants[index].image),
                                backgroundColor: Colors.white,
                              ),
                            ),
                            Text(
                              restaurants[index].socialName,
                              softWrap: true,
                              maxLines: 2,
                              textAlign: TextAlign.center,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                color: Colors.grey,
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Nunito',
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      );
    });
  }
}
