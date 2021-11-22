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

  final _$imgPathAtom = Atom(name: '_RestaurantHomeStoreBase.imgPath');

  @override
  dynamic get imgPath {
    _$imgPathAtom.reportRead();
    return super.imgPath;
  }

  @override
  set imgPath(dynamic value) {
    _$imgPathAtom.reportWrite(value, super.imgPath, () {
      super.imgPath = value;
    });
  }

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

  final _$prodPicAtom = Atom(name: '_RestaurantHomeStoreBase.prodPic');

  @override
  String get prodPic {
    _$prodPicAtom.reportRead();
    return super.prodPic;
  }

  @override
  set prodPic(String value) {
    _$prodPicAtom.reportWrite(value, super.prodPic, () {
      super.prodPic = value;
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

  final _$iconColorAtom = Atom(name: '_RestaurantHomeStoreBase.iconColor');

  @override
  Color get iconColor {
    _$iconColorAtom.reportRead();
    return super.iconColor;
  }

  @override
  set iconColor(Color value) {
    _$iconColorAtom.reportWrite(value, super.iconColor, () {
      super.iconColor = value;
    });
  }

  final _$updateFormControllerAtom =
      Atom(name: '_RestaurantHomeStoreBase.updateFormController');

  @override
  Map<String, TextEditingController> get updateFormController {
    _$updateFormControllerAtom.reportRead();
    return super.updateFormController;
  }

  @override
  set updateFormController(Map<String, TextEditingController> value) {
    _$updateFormControllerAtom.reportWrite(value, super.updateFormController,
        () {
      super.updateFormController = value;
    });
  }

  final _$formProductAtom = Atom(name: '_RestaurantHomeStoreBase.formProduct');

  @override
  Map<String, TextEditingController> get formProduct {
    _$formProductAtom.reportRead();
    return super.formProduct;
  }

  @override
  set formProduct(Map<String, TextEditingController> value) {
    _$formProductAtom.reportWrite(value, super.formProduct, () {
      super.formProduct = value;
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

  final _$cadastrarProdutoTesteAsyncAction =
      AsyncAction('_RestaurantHomeStoreBase.cadastrarProdutoTeste');

  @override
  Future<dynamic> cadastrarProdutoTeste(Product produto) {
    return _$cadastrarProdutoTesteAsyncAction
        .run(() => super.cadastrarProdutoTeste(produto));
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
  void setProductImage(dynamic img) {
    final _$actionInfo = _$_RestaurantHomeStoreBaseActionController.startAction(
        name: '_RestaurantHomeStoreBase.setProductImage');
    try {
      return super.setProductImage(img);
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
  void updateControllers() {
    final _$actionInfo = _$_RestaurantHomeStoreBaseActionController.startAction(
        name: '_RestaurantHomeStoreBase.updateControllers');
    try {
      return super.updateControllers();
    } finally {
      _$_RestaurantHomeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
imgPath: ${imgPath},
restaurant: ${restaurant},
picture: ${picture},
prodPic: ${prodPic},
editBackground: ${editBackground},
category: ${category},
isOpen: ${isOpen},
iconColor: ${iconColor},
updateFormController: ${updateFormController},
formProduct: ${formProduct},
toggleText: ${toggleText}
    ''';
  }
}
