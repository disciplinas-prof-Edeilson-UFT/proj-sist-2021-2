import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:pscomidas/app/global/models/entities/restaurant.dart';
import 'package:pscomidas/app/global/repositories/restaurant_home/profile/profile_repository.dart';
import 'package:pscomidas/app/global/utils/schemas.dart';
import 'package:pscomidas/app/modules/restaurant_home/components/update_address/home_field.dart';
import 'package:search_cep/search_cep.dart';

part 'restaurant_home_store.g.dart';

class RestaurantHomeStore = _RestaurantHomeStoreBase with _$RestaurantHomeStore;

abstract class _RestaurantHomeStoreBase with Store {
  final id = 'dummy1';

  @observable
  Restaurant? restaurant;

  @observable
  String picture = '';

  @action
  Future getRestaurant() async {
    restaurant = await ProfileRepository().getRestaurant();
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
    ProfileRepository().updateInfo({'delivery_plan': selectedPlan});
    actualPlan = selectedPlan!;
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
    'prepare_time': TextEditingController(),
    'delivery_price': TextEditingController(),
    'phone_restaurant': TextEditingController(),
  };

  Map<String, TextEditingController> managementFormController = {
    'name_Owner': TextEditingController(),
    'phone_Owner': TextEditingController(),
    'email_Owner': TextEditingController(),
    'Senha': TextEditingController(),
    'Confirmar Senha': TextEditingController(),
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
    if (managementFormController['Confirmar Senha']?.text !=
        managementFormController['Senha']?.text) {
      if (managementFormController['Confirmar Senha']!.text.isEmpty) {
        return null;
      }
      return "Os campos diferem";
    }
    return null;
  }

  @action
  void updateProfileControllers() {
    profileFormController['restaurant']?.text = restaurant?.socialName ?? '';
    profileFormController['prepare_time']?.text =
        restaurant?.estimatedDelivery ?? '';
    profileFormController['delivery_price']?.text =
        'R\$${restaurant?.deliveryPrice.toStringAsFixed(2)}';
    profileFormController['phone_restaurant']?.text = restaurant?.phone ?? '';
    category = restaurant?.category ?? categories.first;
  }

  @action
  void updateManagementControllers() {
    managementFormController['name_Owner']?.text = restaurant?.nameOwner ?? '';
    managementFormController['phone_Owner']?.text =
        restaurant?.phoneOwner ?? '';
    managementFormController['email_Owner']?.text =
        restaurant?.emailOwner ?? '';
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
