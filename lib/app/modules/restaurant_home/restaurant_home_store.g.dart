// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'restaurant_home_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$RestaurantHomeStore on _RestaurantHomeStoreBase, Store {
  Computed<String>? _$toggleTextComputed;

  @override
  String get toggleText =>
      (_$toggleTextComputed ??= Computed<String>(() => super.toggleText,
              name: '_RestaurantHomeStoreBase.toggleText'))
          .value;

  final _$restaurantAtom = Atom(name: '_RestaurantHomeStoreBase.restaurant');

  @override
  Restaurant? get restaurant {
    _$restaurantAtom.reportRead();
    return super.restaurant;
  }

  @override
  set restaurant(Restaurant? value) {
    _$restaurantAtom.reportWrite(value, super.restaurant, () {
      super.restaurant = value;
    });
  }

  final _$pictureAtom = Atom(name: '_RestaurantHomeStoreBase.picture');

  @override
  String get picture {
    _$pictureAtom.reportRead();
    return super.picture;
  }

  @override
  set picture(String value) {
    _$pictureAtom.reportWrite(value, super.picture, () {
      super.picture = value;
    });
  }

  final _$showLoadingAtom = Atom(name: '_RestaurantHomeStoreBase.showLoading');

  @override
  bool get showLoading {
    _$showLoadingAtom.reportRead();
    return super.showLoading;
  }

  @override
  set showLoading(bool value) {
    _$showLoadingAtom.reportWrite(value, super.showLoading, () {
      super.showLoading = value;
    });
  }

  final _$editBackgroundAtom =
      Atom(name: '_RestaurantHomeStoreBase.editBackground');

  @override
  Widget get editBackground {
    _$editBackgroundAtom.reportRead();
    return super.editBackground;
  }

  @override
  set editBackground(Widget value) {
    _$editBackgroundAtom.reportWrite(value, super.editBackground, () {
      super.editBackground = value;
    });
  }

  final _$isOpenAtom = Atom(name: '_RestaurantHomeStoreBase.isOpen');

  @override
  bool get isOpen {
    _$isOpenAtom.reportRead();
    return super.isOpen;
  }

  @override
  set isOpen(bool value) {
    _$isOpenAtom.reportWrite(value, super.isOpen, () {
      super.isOpen = value;
    });
  }

  final _$getRestaurantAsyncAction =
      AsyncAction('_RestaurantHomeStoreBase.getRestaurant');

  @override
  Future<dynamic> getRestaurant() {
    return _$getRestaurantAsyncAction.run(() => super.getRestaurant());
  }

  final _$toggleLoadingAsyncAction =
      AsyncAction('_RestaurantHomeStoreBase.toggleLoading');

  @override
  Future<void> toggleLoading() {
    return _$toggleLoadingAsyncAction.run(() => super.toggleLoading());
  }

  final _$_RestaurantHomeStoreBaseActionController =
      ActionController(name: '_RestaurantHomeStoreBase');

  @override
  void getProfilePictureUrl() {
    final _$actionInfo = _$_RestaurantHomeStoreBaseActionController.startAction(
        name: '_RestaurantHomeStoreBase.getProfilePictureUrl');
    try {
      return super.getProfilePictureUrl();
    } finally {
      _$_RestaurantHomeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setImage(dynamic e) {
    final _$actionInfo = _$_RestaurantHomeStoreBaseActionController.startAction(
        name: '_RestaurantHomeStoreBase.setImage');
    try {
      return super.setImage(e);
    } finally {
      _$_RestaurantHomeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void editResolver(bool isHovering) {
    final _$actionInfo = _$_RestaurantHomeStoreBaseActionController.startAction(
        name: '_RestaurantHomeStoreBase.editResolver');
    try {
      return super.editResolver(isHovering);
    } finally {
      _$_RestaurantHomeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void toggleOpen() {
    final _$actionInfo = _$_RestaurantHomeStoreBaseActionController.startAction(
        name: '_RestaurantHomeStoreBase.toggleOpen');
    try {
      return super.toggleOpen();
    } finally {
      _$_RestaurantHomeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
restaurant: ${restaurant},
picture: ${picture},
showLoading: ${showLoading},
editBackground: ${editBackground},
isOpen: ${isOpen},
toggleText: ${toggleText}
    ''';
  }
}
