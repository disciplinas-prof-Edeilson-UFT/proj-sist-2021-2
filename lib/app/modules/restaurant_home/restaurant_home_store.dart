import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:pscomidas/app/global/models/entities/restaurant.dart';
import 'package:pscomidas/app/global/repositories/restaurant_home/profile/profile_repository.dart';

part 'restaurant_home_store.g.dart';

class RestaurantHomeStore = _RestaurantHomeStoreBase with _$RestaurantHomeStore;

abstract class _RestaurantHomeStoreBase with Store {

  final id = 'dummy1';
  
  @observable
  Restaurant? restaurant;
  
  @observable
  String picture = '';
  
  @observable
  bool showLoading = true;

  @action
  Future getRestaurant() async {
    restaurant = await ProfileRepository().getRestaurant();
    getProfilePictureUrl();
  }

  @action
  void getProfilePictureUrl() {
    picture = restaurant?.image ?? '';
    toggleLoading();
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
  
  @action 
  Future<void> toggleLoading() async {
    if (showLoading) {
      await Future.delayed(const Duration(seconds: 3));
    }
    showLoading = !showLoading;
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
