import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

part 'restaurant_home_store.g.dart';

class RestaurantHomeStore = _RestaurantHomeStoreBase with _$RestaurantHomeStore;

abstract class _RestaurantHomeStoreBase with Store {
  Map<String, TextEditingController> controller = {
    'Categoria': TextEditingController(),
  };

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
  var selectedCategory = 'Açaí';

  @action
  setSelectedCategory(newValue) {
    selectedCategory = newValue ?? 'Açaí';
    controller['Categoria']!.text = newValue;
  }

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

  @observable
  bool isOpen = false;

  @action
  void toggleOpen() {
    isOpen = !isOpen;
  }

  @computed
  String get toggleText => isOpen ? 'Fechar Loja' : 'Abrir Loja';
}
