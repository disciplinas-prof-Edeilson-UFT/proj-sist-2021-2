import 'package:mobx/mobx.dart';
import 'package:pscomidas/app/modules/register/restaurant/store/models/register_store.dart';

part 'form_error_store.g.dart';

class FormErrorState = _FormErrorState with _$FormErrorState;

abstract class _FormErrorState with Store {
  final RegisterStore error = RegisterStore();

  @computed
  bool get isValid {
    return validateName() == null &&
        validatePhone() == null &&
        validateEmail() == null;
  }

  @action
  String? validateName() {
    if (error.name == null || error.name!.isEmpty) {
      return "Este campo não pode ficar vazio";
    } else if (error.name!.length < 2) {
      return "Precisa conter pelo menos dois nomes";
    }
    return null;
  }

  @action
  String? validatePhone() {
    if (error.phone == null || error.phone!.isEmpty) {
      return "Este campo não pode ficar vazio";
    } else if (error.phone!.length <= 14) {
      return "Digite um número de telefone válido";
    }
    return null;
  }

  @action
  String? validateEmail() {
    if (error.email == null || error.email!.isEmpty) {
      return "Este campo não pode ficar vazio";
    } else if (error.email!.contains('@') || error.email!.contains('.com')) {
      return "Digite um email válido";
    }
    return null;
  }
}
