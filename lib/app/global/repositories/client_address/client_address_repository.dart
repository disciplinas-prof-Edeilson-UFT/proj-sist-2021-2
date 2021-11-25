import 'package:pscomidas/app/global/models/entities/delivery_at.dart';
import 'package:search_cep/search_cep.dart';

class ClientAddressRepository {
  Future<DeliveryAt> findCEP(String cep) async {
    try {
      final viaCep = ViaCepSearchCep();
      final infoCepJson =
          await viaCep.searchInfoByCep(cep: cep.replaceAll('-', ''));
      // print(infoCepJson);
      return infoCepJson.fold(
        (l) => throw l,
        (r) => DeliveryAt(
          street: r.logradouro!,
          block: r.bairro!,
          complement: r.complemento!,
          number: null,
          cep: cep,
          city: r.logradouro!,
          uf: r.uf!,
        ),
      );
    } catch (e) {
      throw e.toString();
    }
  }
}
