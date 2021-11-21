import 'package:search_cep/search_cep.dart';

class ClientAddressRepository {
  Future<void>? fetchCEP(String cep) async {
    try {
      final viaCep = ViaCepSearchCep();
      final infoCepJson = await viaCep.searchInfoByCep(cep: cep);
      print(infoCepJson);
    } catch (e) {
      throw e.toString();
    }
  }
}
