import 'dart:developer';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:pscomidas/app/global/models/entities/product.dart';
import 'package:pscomidas/app/global/repositories/product/product_repository.dart';

part 'restaurant_home_store.g.dart';

class RestaurantHomeStore = _RestaurantHomeStoreBase with _$RestaurantHomeStore;

abstract class _RestaurantHomeStoreBase with Store {
  final ProductRepository productRepository = Modular.get<ProductRepository>();

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

  TextEditingController nameController = TextEditingController();
  TextEditingController descController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController categoriesController = TextEditingController();
  TextEditingController idController = TextEditingController();

  @observable
  bool isOpen = false;

  @observable
  bool available = false;

  @action
  void toggleOpen() {
    isOpen = !isOpen;
  }

  @action
  Future cadastrarProdutoTeste(Product produto) async {
    await productRepository.cadastrarProduct(produto);
    log('Deu certo');
  }

  @computed
  String get toggleText => isOpen ? 'Fechar Loja' : 'Abrir Loja';
}
