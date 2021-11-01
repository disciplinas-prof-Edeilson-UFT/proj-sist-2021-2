import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pscomidas/app/modules/restaurant_home/restaurant_home_store.dart';

abstract class ProfileF {
  Future<String> getProfilePicture();
}

class ProfilePictureFirestore extends ProfileF {
  final restaurantHomeStore = Modular.get<RestaurantHomeStore>();
  @override
  Future<String> getProfilePicture() async {
    String profilePicture;
    profilePicture = await FirebaseStorage.instance
      .ref('restaurant_profile/${restaurantHomeStore.id}').getDownloadURL();
    
    return profilePicture;
  }
}
