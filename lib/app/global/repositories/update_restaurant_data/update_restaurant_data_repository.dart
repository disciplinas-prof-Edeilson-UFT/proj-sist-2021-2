import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pscomidas/app/global/models/entities/restaurant.dart';
import 'package:pscomidas/app/global/repositories/update_restaurant_data/update_restaurant_data_service.dart';
import 'package:pscomidas/app/modules/restaurant_home/restaurant_home_store.dart';

class UpdateRestaurantDataRepository extends UpdateRestaurantDataService {
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
  Future<void> setProfileRestaurant(Restaurant restaurant) async {
    await FirebaseFirestore.instance
        .collection('restaurant')
        .doc(store.id)
        .update({
      'socialName':
          _verifyForm(store.profileFormController['restaurant']?.text) ??
              restaurant.socialName,
      'phoneRestaurant':
          _verifyForm(store.profileFormController['phoneRestaurant']?.text) ??
              restaurant.phone,
      'category': store.category,
      'prepareTime':
          _verifyForm(store.profileFormController['prepareTime']?.text) ??
              restaurant.prepareTime,
      'deliveryPrice': _parsePrice(_verifyForm(
              store.profileFormController['deliveryPrice']?.text)) ??
          restaurant.deliveryPrice,
    });
    store.updateProfileControllers();
  }

  @override
  Future<void> setManagementRestaurant(Restaurant restaurant) async {
    await FirebaseFirestore.instance
        .collection('restaurant')
        .doc(store.id)
        .update({
      'nameOwner':
          _verifyForm(store.managementFormController['nameOwner']?.text) ??
              restaurant.nameOwner,
      'phoneOwner':
          _verifyForm(store.managementFormController['phoneOwner']?.text) ??
              restaurant.phoneOwner,
      'emailOwner':
          _verifyForm(store.managementFormController['emailOwner']?.text) ??
              restaurant.emailOwner,
      'password': _verifyForm(store.managementFormController['Senha']?.text) ??
          restaurant.password,
    });
    store.updateManagementControllers();
  }

  @override
  Future<void> setAdressRestaurant(Restaurant restaurant) async {
    await FirebaseFirestore.instance
        .collection('restaurant')
        .doc(store.id)
        .update({
      'CEP': _verifyForm(store.addressFormController['CEP']?.text) ??
          restaurant.cep,
      'city': _verifyForm(store.addressFormController['Cidade']?.text) ??
          restaurant.city,
      'state': _verifyForm(store.addressFormController['Estado']?.text) ??
          restaurant.state,
      'district': _verifyForm(store.addressFormController['Bairro']?.text) ??
          restaurant.district,
      'address': _verifyForm(store.addressFormController['Endereço']?.text) ??
          restaurant.address,
      'number': _verifyForm(store.addressFormController['Número']?.text) ??
          restaurant.number,
      'complement': _verifyForm(
              store.addressFormController['Complemento (Opcional)']?.text) ??
          restaurant.complement,
    });
    store.updateAddressControllers();
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

  Future updateInfo(Map<String, dynamic> info) async {
    await FirebaseFirestore.instance
        .collection('restaurant')
        .doc(store.id)
        .update(info);
  }
}
