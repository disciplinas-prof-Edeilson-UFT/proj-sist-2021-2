// ignore_for_file: file_names

import 'package:mobx/mobx.dart';
part 'addCard_store.g.dart';

class AddCardStore = _AddCardStoreBase with _$AddCardStore;

abstract class _AddCardStoreBase with Store {

  _AddCardStoreBase(
    {required this.numero_cartao,
    required this.nome_impresso,
    required this.apelido,
    required this.validade,
    required this.cvv,
    required this.cpf_cnpj}
  );

  @observable
  String type = '';
  @action
  setType(String value) => type = value; 

  @observable
  String numero_cartao;
  @action
  void setNumero_cartao(String value) => numero_cartao = value;

  @observable
  String nome_impresso;
  @action
  void setNome_impresso(String value) => nome_impresso = value;

  @observable
  String apelido;
  @action
  void setApelido(String value) => apelido = value;

  @observable
  String validade;
  @action
  void setValidade(String value) => validade = value;

  @observable
  String cvv;
  @action
  void setCvv(String value) => cvv = value;

  @observable
  String cpf_cnpj;
  @action
  void setCpf_cnpj(String value) => cpf_cnpj = value;

}