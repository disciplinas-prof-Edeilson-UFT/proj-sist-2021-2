import 'package:firebase_storage/firebase_storage.dart';
import 'package:mobx/mobx.dart';

part 'restaurant_home_store.g.dart';

class RestaurantHomeStore = _RestaurantHomeStoreBase with _$RestaurantHomeStore;

abstract class _RestaurantHomeStoreBase with Store {
  @action
  Future imageReceiver(dynamic e) async {
    try {
      await FirebaseStorage.instance.ref('uploads/${e.name}').putBlob(e);
    } catch (e) {
      //oopsie
    }
  }
}
