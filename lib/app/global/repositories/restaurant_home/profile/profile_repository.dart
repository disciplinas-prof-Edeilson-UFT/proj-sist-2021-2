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
    final restaurantData = await FirebaseFirestore.instance
        .collection('restaurant')
        .doc(store.id)
        .get()
        .then((value) => value.data()!);
    final restaurant = Restaurant.fromMap(store.id, restaurantData);
    return restaurant;
  }

  double? _parsePrice(String? text) {
    return double.tryParse(text?.split('\$').last ?? '');
  }

  String? _verifyForm(String? text) {
    if (text == null) return null;
    return text.isEmpty ? null : text;
  }

  @override
  Future<void> setRestaurant(Restaurant restaurant) async {
    await FirebaseFirestore.instance
        .collection('restaurant')
        .doc(store.id)
        .update({
      'social_name':
          _verifyForm(store.updateFormController['restaurant']?.text) ??
              restaurant.socialName,
      'phone_restaurant':
          _verifyForm(store.updateFormController['phone_restaurant']?.text) ??
              restaurant.phone,
      'category': store.category,
      'estimated_delivery':
          _verifyForm(store.updateFormController['prepare_time']?.text) ??
              restaurant.estimatedDelivery,
      'delivery_price': _parsePrice(_verifyForm(
              store.updateFormController['delivery_price']?.text)) ??
          restaurant.deliveryPrice,
    });
  }

  @override
  Future<void> setImage(dynamic e) async {
    if (e.type != 'image/jpeg' && e.type != 'image/png') {
      return;
    }
    store.picture = '';
    String imgUrl;
    try {
      imgUrl = await FirebaseStorage.instance
          .ref('restaurant_profile/${store.id}')
          .putBlob(e)
          .then((task) => task.ref.getDownloadURL());
      store.picture = imgUrl;
    } catch (e) {
      return;
    }
    await FirebaseFirestore.instance
        .collection('restaurant')
        .doc(store.id)
        .update({'image': imgUrl});
  }
}
