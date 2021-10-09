import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:pscomidas/app/global/models/entities/item.dart';
import 'package:pscomidas/app/global/models/entities/product.dart';
part 'cart_store.g.dart';

class CartStore = _CartStoreBase with _$CartStore;

abstract class _CartStoreBase with Store {
  @observable
  List<Item> placeholder = [
    Item(
      Product(
        available: true,
        name: 'HAMBÚRGUER X-TUDO',
        price: 13.90,
        imgUrl:
            'https://firebasestorage.googleapis.com/v0/b/ps-comidas.appspot.com/o/burguer.jpeg?alt=media&token=bdd577aa-d3da-47ef-b827-0ceee0d43698',
        description:
            'Ingredientes: Pão, queijo, presunto, hambúrguer, milho, ovo, bacon',
      ),
      25,
      'f158G',
    )
  ];
}
