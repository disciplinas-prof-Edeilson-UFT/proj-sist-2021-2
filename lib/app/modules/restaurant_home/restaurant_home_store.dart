import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:pscomidas/app/global/utils/schemas.dart';
import 'package:pscomidas/app/modules/restaurant_home/components/update_profile/profile_picture_firestore.dart';

part 'restaurant_home_store.g.dart';

class RestaurantHomeStore = _RestaurantHomeStoreBase with _$RestaurantHomeStore;

abstract class _RestaurantHomeStoreBase with Store {
  final id = 'dummy1';

  final categories = [
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

  @observable
  String picture = '';

  @observable
  bool showLoading = true;

  @action
  Future<void> toggleLoading() async {
    /*Controla o circularProgressIndicator, o atraso para desativar
    se deve ao fato da imagem demorar para ser baixada.
    */
    if (showLoading) {
      await Future.delayed(const Duration(seconds: 3));
    }
    showLoading = !showLoading;
  }

  @action
  Future<String> getProfilePictureUrl() async {
    final ProfilePictureFirestore profile = ProfilePictureFirestore();
    picture = await profile.getProfilePicture();
    toggleLoading();
    return picture;
  }

  @action
  Future setImage(dynamic e) async {
    if (e.type != 'image/jpeg' && e.type != 'image/png') {
      return;
    }
    picture = '';
    showLoading = true;
    String imgUrl;
    toggleLoading();
    try {
      imgUrl = await FirebaseStorage.instance
          .ref('restaurant_profile/$id')
          .putBlob(e)
          .then((task) => task.ref.getDownloadURL());
      getProfilePictureUrl();
    } catch (e) {
      return;
    }
    FirebaseFirestore.instance
        .collection('restaurant')
        .doc(id)
        .update({'image': imgUrl});
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

  @observable
  bool isOpen = false;

  @action
  void toggleOpen() {
    isOpen = !isOpen;
  }

  @computed
  String get toggleText => isOpen ? 'Fechar Loja' : 'Abrir Loja';

  @observable
  var selectedCategory = 'Açaí';

  @action
  setSelectedCategory(newValue) {
    selectedCategory = newValue ?? 'Açaí';
  }

  @observable
  Color iconColor = tertiaryColor;

  @action
  void handleFocusChange() {
    if (iconColor == tertiaryColor) {
      iconColor = secondaryColor;
    } else {
      iconColor = tertiaryColor;
    }
  }
}
