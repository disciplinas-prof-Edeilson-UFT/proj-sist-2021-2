import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pscomidas/app/global/models/entities/restaurant.dart';
import 'package:pscomidas/app/global/repositories/restaurant_home/profile/profile_repository_interface.dart';
import 'package:pscomidas/app/modules/restaurant_home/restaurant_home_store.dart';

class ProfileRepository extends IProfile {
  final store = Modular.get<RestaurantHomeStore>();

  @override
  Future<Restaurant> getRestaurant() async {
    final restaurantData = await FirebaseFirestore.instance.collection('restaurant')
      .doc(store.id).get().then((value) => value.data()!);
    final restaurant = Restaurant.fromMap(store.id, restaurantData);
    return restaurant;
  }

  @override
  Future setImage(e) async {
    if (e.type != 'image/jpeg' && e.type != 'image/png') {
      return;
    }
    store.picture = '';
    store.showLoading = true;
    String imgUrl;
    store.toggleLoading();
    try {
      imgUrl = await FirebaseStorage.instance.ref('restaurant_profile/${store.id}')
        .putBlob(e).then((task) => task.ref.getDownloadURL());
      store.picture = imgUrl;
    } catch (e) {
      return;
    }
    await FirebaseFirestore.instance.collection('restaurant').doc(store.id).update({'image': imgUrl});
  }
}