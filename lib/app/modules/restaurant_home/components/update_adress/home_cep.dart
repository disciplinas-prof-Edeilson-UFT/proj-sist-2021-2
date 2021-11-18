import 'package:pscomidas/app/modules/restaurant_home/restaurant_home_store.dart';
import 'package:search_cep/search_cep.dart';

class HomeCEP {
  void searchAdress(String value, RestaurantHomeStore homeStore) async {
    //Esta função atribui os valores de endereço dinamicamente conforme o CEP informado.

    final info = await ViaCepSearchCep()
        .searchInfoByCep(cep: value.replaceFirst('-', ''));

    if (info.isRight()) {
      homeStore.controller['Endereço']!.text =
          info.getOrElse(() => ViaCepInfo()).logradouro ?? '';
      homeStore.controller['Cidade']!.text =
          info.getOrElse(() => ViaCepInfo()).localidade ?? '';
      homeStore.controller['Estado']!.text =
          info.getOrElse(() => ViaCepInfo()).uf ?? '';
      homeStore.controller['Bairro']!.text =
          info.getOrElse(() => ViaCepInfo()).bairro ?? '';
    } else {
      homeStore.controller['Endereço']!.text = '';
      homeStore.controller['Cidade']!.text = '';
      homeStore.controller['Estado']!.text = '';
      homeStore.controller['Bairro']!.text = '';
    }
  }
}
