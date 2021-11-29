import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pscomidas/app/global/models/entities/restaurant.dart';
import 'package:pscomidas/app/modules/home/store/home_store.dart';
import 'package:flutter_modular/flutter_modular.dart';

abstract class RestaurantGridF {
  Future<List<Restaurant>> getRestaurants();
}

class RestaurantGridFirestore extends RestaurantGridF {
  final homeStore = Modular.get<HomeStore>();
  @override
  Future<List<Restaurant>> getRestaurants() async {
    QuerySnapshot<Map<String, dynamic>> querySnapshot;

    querySnapshot =
        await FirebaseFirestore.instance.collection('restaurant').get();

    return querySnapshot.docs.where((e) => itemIsValid(e)).map((doc) {
      return Restaurant.fromMap(doc.id, doc.data());
    }).toList();
  }

  bool itemIsValid(doc) {
    try {
      Restaurant.fromMap(doc.id, doc.data());
    } catch (e) {
      return false;
    }
    return true;
  }
}
