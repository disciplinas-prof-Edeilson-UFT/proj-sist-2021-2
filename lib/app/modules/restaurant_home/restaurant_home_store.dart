import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:pscomidas/app/global/models/entities/restaurant.dart';
import 'package:pscomidas/app/global/repositories/restaurant_home/profile/profile_repository.dart';
import 'package:pscomidas/app/global/utils/schemas.dart';
part 'restaurant_home_store.g.dart';

class RestaurantHomeStore = _RestaurantHomeStoreBase with _$RestaurantHomeStore;

abstract class _RestaurantHomeStoreBase with Store {
  final id = 'dummy1';

  @observable
  Restaurant? restaurant;

  @observable
  String picture = '';

  @action
  Future getRestaurant() async {
    restaurant = await ProfileRepository().getRestaurant();
    getProfilePictureUrl();
  }

  @action
  void getProfilePictureUrl() {
    picture = restaurant?.image ?? '';
  }

  @action
  void setImage(dynamic e) {
    ProfileRepository().setImage(e);
  }

  @observable
  Widget editBackground = Container();

  @action
  void editResolver(bool isHovering) {
    if (isHovering) {
      editBackground = Opacity(
        opacity: 0.5,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(60),
          ),
          child: const Image(
            image: AssetImage("images/restaurant_home/editProfile.png"),
          ),
        ),
      );
    } else {
      editBackground = Container();
    }
  }

  static final _categories = [
    'Açaí',
    'Lanches',
    'Padarias',
    'Pizza',
    'Saudável',
    'Bolos e Doces',
    'Bebidas',
    'Vegetariana',
    'Italiana',
    'Sorvetes',
    'Asiática',
  ];

  final categories = _categories;

  @observable
  String category = _categories[0];

  @action
  Future imageReceiver(dynamic e) async {
    if (e.type != 'image/jpeg' && e.type != 'image/png') {
      return;
    }
    try {
      await FirebaseStorage.instance.ref('uploads/${e.name}').putBlob(e);
    } catch (e) {
      //oopsie
    }
  }

  FocusNode profileAlertDialogRestaurantFieldFocus = FocusNode();

  @observable
  bool isOpen = false;

  @action
  void toggleOpen() {
    isOpen = !isOpen;
  }

  @computed
  String get toggleText => isOpen ? 'Fechar Loja' : 'Abrir Loja';

  @observable
  Color iconColor = tertiaryColor;

  @action
  void handleFocusChange() {
    if (profileAlertDialogRestaurantFieldFocus.hasFocus) {
      iconColor = secondaryColor;
    } else {
      iconColor = tertiaryColor;
    }
  }

  @observable
  Map<String, TextEditingController> updateFormController = {
    'restaurant': TextEditingController(),
    'prepare_time': TextEditingController(),
    'delivery_price': TextEditingController(),
    'phone_restaurant': TextEditingController(),
  };

  @action
  void updateControllers() {
    updateFormController['restaurant']?.text = restaurant?.socialName ?? '';
    updateFormController['prepare_time']?.text =
        restaurant?.estimatedDelivery ?? '';
    updateFormController['delivery_price']?.text =
        'R\$${restaurant?.deliveryPrice.toStringAsFixed(2)}';
    updateFormController['phone_restaurant']?.text = restaurant?.phone ?? '';
    category = restaurant?.category ?? categories.first;
  }
}
