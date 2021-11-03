import 'package:pscomidas/app/modules/restaurant_register/restaurant_register_store.dart';
import 'package:search_cep/search_cep.dart';

class RegisterCEP {
  void searchAdress(String value, RestaurantRegisterStore registerStore) async {
    //Esta função atribui os valores de endereço dinamicamente conforme o CEP informado.

    final info = await ViaCepSearchCep()
        .searchInfoByCep(cep: value.replaceFirst('-', ''));

    if (info.isRight()) {
      registerStore.controller['Endereço']!.text =
          info.getOrElse(() => ViaCepInfo()).logradouro ?? '';
      registerStore.controller['Cidade']!.text =
          info.getOrElse(() => ViaCepInfo()).localidade ?? '';
      registerStore.controller['Estado']!.text =
          info.getOrElse(() => ViaCepInfo()).uf ?? '';
      registerStore.controller['Bairro']!.text =
          info.getOrElse(() => ViaCepInfo()).bairro ?? '';
    } else {
      registerStore.controller['Endereço']!.text = '';
      registerStore.controller['Cidade']!.text = '';
      registerStore.controller['Estado']!.text = '';
      registerStore.controller['Bairro']!.text = '';
    }
  }
}
