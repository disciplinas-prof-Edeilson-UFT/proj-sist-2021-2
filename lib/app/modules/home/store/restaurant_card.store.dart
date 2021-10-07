import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

part 'restaurant_card.store.g.dart';

class RestaurantCardStore = _RestaurantCardStore with _$RestaurantCardStore;

abstract class _RestaurantCardStore with Store {
  @observable
  Color color = Colors.white;

  @action
  colordefine(_hovering) {
    if (_hovering) {
      color = Colors.grey[200]!;
    } else {
      color = Colors.white;
    }
  }
}
