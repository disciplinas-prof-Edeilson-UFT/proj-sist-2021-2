import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pscomidas/app/global/models/entities/restaurant.dart';
import 'package:pscomidas/app/modules/restaurant/restaurant_module.dart';

class MostOrdered extends StatelessWidget {
  const MostOrdered({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CollectionReference restaurants =
        FirebaseFirestore.instance.collection('restaurant');

    return Center(
      child: FutureBuilder<QuerySnapshot>(
        future: restaurants.orderBy('orders', descending: true).get(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return const Text(
              'Algo deu errado',
              softWrap: true,
              maxLines: 2,
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                fontFamily: 'Nunito',
              ),
            );
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          }

          return Padding(
            padding: const EdgeInsets.only(bottom: 16.0),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              height: 150.0,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: snapshot.data!.docs.map((DocumentSnapshot document) {
                  Map<String, dynamic> data =
                      document.data()! as Map<String, dynamic>;
                  Restaurant restaurant = Restaurant(
                    document.id,
                    category: data['category'] ?? '',
                    deliveryPrice: data['delivery_price'] ?? 0,
                    distance: data['distance'] ?? 0,
                    estimatedDelivery: data['estimated_delivery'] ?? '',
                    image: data['image'] ?? '',
                    isChampion: data['isChampion'] ?? false,
                    orders: data['orders'] ?? 0,
                    socialName: data['social_name'] ?? '',
                    avaliation: data['avaliation'] ?? 0,
                    cupom: data['cupom'],
                  );
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: SizedBox(
                      width: 135.0,
                      child: MouseRegion(
                        cursor: SystemMouseCursors.click,
                        child: GestureDetector(
                          onTap: () {
                            Modular.to.pushNamed(
                              RestaurantModule.routeName,
                              arguments: restaurant,
                            );
                          },
                          child: Column(
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.only(bottom: 20.0),
                                child: CircleAvatar(
                                  radius: 45.0,
                                  backgroundImage:
                                      NetworkImage(data['image'] ?? ''),
                                ),
                              ),
                              Text(
                                data['social_name'] ?? 'Sem nome',
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
                }).toList(),
              ),
            ),
          );
        },
      ),
    );
  }
}
