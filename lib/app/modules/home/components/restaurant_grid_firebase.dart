import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pscomidas/app/global/models/entities/restaurant.dart';
import 'package:pscomidas/app/modules/home/store/home_store.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pscomidas/app/global/models/enums/filter.dart';

abstract class RestaurantGridF {
  Future<List<Restaurant>> getRestaurants();
}

class RestaurantGridFirestore extends RestaurantGridF {
  final homeStore = Modular.get<HomeStore>();
  @override
  Future<List<Restaurant>> getRestaurants() async {
    QuerySnapshot<Map<String, dynamic>> querySnapshot;

    querySnapshot = await FirebaseFirestore.instance
        .collection('restaurant')
        .orderBy(homeStore.selectedFilter.filterBackEnd,
            descending:
                homeStore.selectedFilter.filterBackEnd == 'avaliation' ||
                    homeStore.selectedFilter.filterBackEnd == 'cupom')
        .get();

    return querySnapshot.docs
        .map((doc) => Restaurant.fromMap(doc.id, doc.data()))
        .toList();
  }
}
