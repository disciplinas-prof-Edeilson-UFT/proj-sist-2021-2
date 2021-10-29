import 'package:firebase_storage/firebase_storage.dart';
import 'package:mobx/mobx.dart';
import 'package:pscomidas/app/modules/restaurant_home/components/update_profile/profile_picture_firestore.dart';

part 'restaurant_home_store.g.dart';

class RestaurantHomeStore = _RestaurantHomeStoreBase with _$RestaurantHomeStore;

abstract class _RestaurantHomeStoreBase with Store {

  final id = 'dummy1';
  @observable
  String picture = '';

  @action
  Future<String> getProfilePictureUrl() async {
    final ProfileFirestore profileFirestore =
        ProfileFirestore();
    picture = await profileFirestore.getProfilePicture();
    return picture;
  }

  @action
  Future imageReceiver(dynamic e) async {
    if (e.type != 'image/jpeg' && e.type != 'image/png') {
      return;
    } 
    try {
      await FirebaseStorage.instance.ref('restaurant_profile/$id').putBlob(e);
      getProfilePictureUrl();
    } catch (e) {
      //oopsie
    }
  }

  @observable
  bool isOpen = false;

  @action
  void toggleOpen() {
    isOpen = !isOpen;
  }

  @computed
  String get toggleText => isOpen ? 'Fechar Loja' : 'Abrir Loja';
}
