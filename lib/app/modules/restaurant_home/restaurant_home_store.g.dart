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

  final _$categoryAtom = Atom(name: '_RestaurantHomeStoreBase.category');

  @override
  String get category {
    _$categoryAtom.reportRead();
    return super.category;
  }

  @override
  set category(String value) {
    _$categoryAtom.reportWrite(value, super.category, () {
      super.category = value;
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

  final _$selectedPlanAtom =
      Atom(name: '_RestaurantHomeStoreBase.selectedPlan');

  @override
  String? get selectedPlan {
    _$selectedPlanAtom.reportRead();
    return super.selectedPlan;
  }

  @override
  set selectedPlan(String? value) {
    _$selectedPlanAtom.reportWrite(value, super.selectedPlan, () {
      super.selectedPlan = value;
    });
  }

  final _$actualPlanAtom = Atom(name: '_RestaurantHomeStoreBase.actualPlan');

  @override
  String get actualPlan {
    _$actualPlanAtom.reportRead();
    return super.actualPlan;
  }

  @override
  set actualPlan(String value) {
    _$actualPlanAtom.reportWrite(value, super.actualPlan, () {
      super.actualPlan = value;
    });
  }

  final _$profileFormControllerAtom =
      Atom(name: '_RestaurantHomeStoreBase.profileFormController');

  @override
  Map<String, TextEditingController> get profileFormController {
    _$profileFormControllerAtom.reportRead();
    return super.profileFormController;
  }

  @override
  set profileFormController(Map<String, TextEditingController> value) {
    _$profileFormControllerAtom.reportWrite(value, super.profileFormController,
        () {
      super.profileFormController = value;
    });
  }

  final _$getRestaurantAsyncAction =
      AsyncAction('_RestaurantHomeStoreBase.getRestaurant');

  @override
  Future<dynamic> getRestaurant() {
    return _$getRestaurantAsyncAction.run(() => super.getRestaurant());
  }

  final _$imageReceiverAsyncAction =
      AsyncAction('_RestaurantHomeStoreBase.imageReceiver');

  @override
  Future<dynamic> imageReceiver(dynamic e) {
    return _$imageReceiverAsyncAction.run(() => super.imageReceiver(e));
  }

  final _$getRestaurantPlanAsyncAction =
      AsyncAction('_RestaurantHomeStoreBase.getRestaurantPlan');

  @override
  Future<dynamic> getRestaurantPlan() {
    return _$getRestaurantPlanAsyncAction.run(() => super.getRestaurantPlan());
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
  void selectPlan(dynamic value) {
    final _$actionInfo = _$_RestaurantHomeStoreBaseActionController.startAction(
        name: '_RestaurantHomeStoreBase.selectPlan');
    try {
      return super.selectPlan(value);
    } finally {
      _$_RestaurantHomeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void updatePlan() {
    final _$actionInfo = _$_RestaurantHomeStoreBaseActionController.startAction(
        name: '_RestaurantHomeStoreBase.updatePlan');
    try {
      return super.updatePlan();
    } finally {
      _$_RestaurantHomeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void handleFocusChange() {
    final _$actionInfo = _$_RestaurantHomeStoreBaseActionController.startAction(
        name: '_RestaurantHomeStoreBase.handleFocusChange');
    try {
      return super.handleFocusChange();
    } finally {
      _$_RestaurantHomeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void updateProfileControllers() {
    final _$actionInfo = _$_RestaurantHomeStoreBaseActionController.startAction(
        name: '_RestaurantHomeStoreBase.updateProfileControllers');
    try {
      return super.updateProfileControllers();
    } finally {
      _$_RestaurantHomeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void updateManagementControllers() {
    final _$actionInfo = _$_RestaurantHomeStoreBaseActionController.startAction(
        name: '_RestaurantHomeStoreBase.updateManagementControllers');
    try {
      return super.updateManagementControllers();
    } finally {
      _$_RestaurantHomeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void updateAddressControllers() {
    final _$actionInfo = _$_RestaurantHomeStoreBaseActionController.startAction(
        name: '_RestaurantHomeStoreBase.updateAddressControllers');
    try {
      return super.updateAddressControllers();
    } finally {
      _$_RestaurantHomeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
restaurant: ${restaurant},
picture: ${picture},
editBackground: ${editBackground},
category: ${category},
isOpen: ${isOpen},
selectedPlan: ${selectedPlan},
actualPlan: ${actualPlan},
profileFormController: ${profileFormController},
toggleText: ${toggleText}
    ''';
  }
}
