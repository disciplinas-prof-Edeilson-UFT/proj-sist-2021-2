/* import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class MoreOrders extends StatefulWidget {
  const MoreOrders({ Key? key }) : super(key: key);

  @override
  _MoreOrdersState createState() => _MoreOrdersState();
}

class _MoreOrdersState extends State<MoreOrders> {

  CollectionReference restaurants = FirebaseFirestore.instance.collection('restaurant');

  @override
  Widget build(BuildContext context) {
    return ListView(
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
    );
  }
} */