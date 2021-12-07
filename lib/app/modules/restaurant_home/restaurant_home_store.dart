import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:pscomidas/app/global/models/entities/product.dart';
import 'package:pscomidas/app/global/models/entities/restaurant.dart';
import 'package:pscomidas/app/global/repositories/products/product_repository.dart';
import 'package:pscomidas/app/global/repositories/update_restaurant_data/update_restaurant_data_repository.dart';
import 'package:pscomidas/app/global/utils/schemas.dart';
import 'package:pscomidas/app/modules/restaurant_home/components/update_address/home_field.dart';
import 'package:search_cep/search_cep.dart';

part 'restaurant_home_store.g.dart';

class RestaurantHomeStore = _RestaurantHomeStoreBase with _$RestaurantHomeStore;

abstract class _RestaurantHomeStoreBase with Store {
  String id = 'dummy1';

  @observable
  dynamic imgPath;

  dynamic imgPathAux;

  @observable
  Restaurant? restaurant;

  @observable
  String picture = '';

  @observable
  String prodPic = '';

  @action
  Future getRestaurant() async {
    restaurant = await UpdateRestaurantDataRepository().getRestaurant();
    updateProfileControllers();
    updateManagementControllers();
    updateAddressControllers();
    getProfilePictureUrl();
  }

  @action
  void getProfilePictureUrl() {
    picture = restaurant?.image ?? '';
  }

  @action
  void setImage(dynamic e) {
    UpdateRestaurantDataRepository().setImage(e);
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

  final formKey = GlobalKey<FormState>();
  final fields = HomeField.fields;
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
  void prodctFormCleaner() {
    formProduct['name']?.text = "";
    formProduct['desc']?.text = "";
    formProduct['price']?.text = "";
    formProduct['categories']?.text = "";
    imgPathAux = null;
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

  FocusNode profileAlertDialogRestaurantFieldFocus = FocusNode();

  @observable
  bool isOpen = false;

  @action
  void toggleOpen() {
    isOpen = !isOpen;
  }

  @action
  Future cadastroProduto() async {
    var price = formProduct['price']!.text.split('R\$');
    double doublePrice = double.parse(price.elementAt(1));
    var produto = Product(
      name: formProduct['name']!.text.toString(),
      description: formProduct['desc']!.text.toString(),
      price: doublePrice,
      restaurantId: "dummy 2",
      categories: formProduct['categories']!.text.toString(),
    );
    await ProductRepository().cadastrarProduct(produto);
  }

  @action
  void setProductImage(dynamic img) {
    imgPath = img;
    imgPathAux = img;
  }

  @computed
  String get toggleText => isOpen ? 'Fechar Loja' : 'Abrir Loja';

  @observable
  String? selectedPlan;

  @observable
  String actualPlan = '';

  @action
  Future getRestaurantPlan() async {
    if (restaurant == null) await getRestaurant();
    actualPlan = restaurant?.deliveryPlan ?? '';
  }

  @action
  void selectPlan(value) {
    selectedPlan = value;
  }

  @action
  void updatePlan() {
    UpdateRestaurantDataRepository().updateInfo({'deliveryPlan': selectedPlan});
    actualPlan = selectedPlan!;
  }

  TextEditingController valueController = TextEditingController();

  @observable
  Map<String, dynamic>? selectedCupom = {
    "tipo": null,
    "valor": null,
  };

  @observable
  Map<String, dynamic>? actualCupom = {
    "tipo": null,
    "valor": null,
  };

  @action
  Future getRestaurantCupom() async {
    if (restaurant == null) await getRestaurant();
    actualCupom!['tipo'] = restaurant!.cupom!['tipo'];
    if (actualCupom!['tipo'] == 'desconto') {
      actualCupom!['valor'] = restaurant!.cupom!['valor'];
    }
    selectedCupom = actualCupom;
    valueController = TextEditingController();
  }

  @action
  void setSelectedCupom(name) {
    selectedCupom = {"tipo": name};
    cupomButtonResolver();
  }

  @action
  void setSelectedCupomValue(value) {
    selectedCupom!['valor'] = value;
    cupomButtonResolver();
  }

  @action
  void updateCupom() {
    UpdateRestaurantDataRepository().updateInfo({'cupom': selectedCupom});
    actualCupom = selectedCupom;
    if (actualCupom!['tipo'] == 'desconto') {
      valueController.text = 'R\$' + actualCupom!['valor'].toString();
    }
    cupomButtonResolver();
  }

  @observable
  bool resolveCupomButton = false;

  @action
  void cupomButtonResolver() {
    if (selectedCupom == null || selectedCupom!['tipo'] == null) {
      resolveCupomButton = false;
      return;
    } else if (selectedCupom!['tipo'] == actualCupom!['tipo']) {
      if (valueController.text.replaceAll(RegExp('[^0-9]'), '') !=
              actualCupom!['valor'].toString() &&
          actualCupom!['tipo'] == 'desconto') {
        resolveCupomButton = true;
        return;
      }
      resolveCupomButton = false;
      return;
    }
    resolveCupomButton = true;
  }

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
  Map<String, TextEditingController> profileFormController = {
    'restaurant': TextEditingController(),
    'prepareTime': TextEditingController(),
    'deliveryPrice': TextEditingController(),
    'phoneRestaurant': TextEditingController(),
  };

  @observable
  Map<String, TextEditingController> formProduct = {
    'name': TextEditingController(),
    'desc': TextEditingController(),
    'price': TextEditingController(),
    'categories': TextEditingController(),
  };

  Map<String, TextEditingController> managementFormController = {
    'nameOwner': TextEditingController(),
    'phoneOwner': TextEditingController(),
    'emailOwner': TextEditingController(),
    'password': TextEditingController(),
    'confirmPassword': TextEditingController(),
  };

  Map<String, TextEditingController> addressFormController = {
    'CEP': TextEditingController(),
    'Cidade': TextEditingController(),
    'Estado': TextEditingController(),
    'Bairro': TextEditingController(),
    'Endereço': TextEditingController(),
    'Número': TextEditingController(),
    'Complemento (Opcional)': TextEditingController(),
  };

  String? validatePassword() {
    if (managementFormController['confirmPassword']?.text !=
        managementFormController['password']?.text) {
      if (managementFormController['confirmPassword']!.text.isEmpty) {
        return null;
      }
      return "Os campos diferem";
    }
    return null;
  }

  @action
  void updateProfileControllers() {
    profileFormController['restaurant']?.text = restaurant?.socialName ?? '';
    profileFormController['prepareTime']?.text = restaurant?.prepareTime ?? '';
    profileFormController['deliveryPrice']?.text =
        'R\$${restaurant?.deliveryPrice.toStringAsFixed(2)}';
    profileFormController['phoneRestaurant']?.text = restaurant?.phone ?? '';
    category = restaurant?.category ?? categories.first;
  }

  @action
  void updateManagementControllers() {
    managementFormController['nameOwner']?.text = restaurant?.nameOwner ?? '';
    managementFormController['phoneOwner']?.text = restaurant?.phoneOwner ?? '';
    managementFormController['emailOwner']?.text = restaurant?.emailOwner ?? '';
  }

  @action
  void updateAddressControllers() {
    addressFormController['CEP']?.text = restaurant?.cep ?? '';
    addressFormController['Cidade']?.text = restaurant?.city ?? '';
    addressFormController['Estado']?.text = restaurant?.state ?? '';
    addressFormController['Bairro']?.text = restaurant?.district ?? '';
    addressFormController['Endereço']?.text = restaurant?.address ?? '';
    addressFormController['Número']?.text = restaurant?.number ?? '';
    addressFormController['Complemento (Opcional)']?.text =
        restaurant?.complement ?? '';
  }

  void searchAdress(String value) async {
    //Esta função atribui os valores de endereço dinamicamente conforme o CEP informado.

    final info = await ViaCepSearchCep()
        .searchInfoByCep(cep: value.replaceFirst('-', ''));

    if (info.isRight()) {
      addressFormController['Endereço']!.text =
          info.getOrElse(() => ViaCepInfo()).logradouro ?? '';
      addressFormController['Cidade']!.text =
          info.getOrElse(() => ViaCepInfo()).localidade ?? '';
      addressFormController['Estado']!.text =
          info.getOrElse(() => ViaCepInfo()).uf ?? '';
      addressFormController['Bairro']!.text =
          info.getOrElse(() => ViaCepInfo()).bairro ?? '';
    } else {
      addressFormController['Endereço']!.text = '';
      addressFormController['Cidade']!.text = '';
      addressFormController['Estado']!.text = '';
      addressFormController['Bairro']!.text = '';
    }
  }
}
