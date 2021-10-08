

import 'package:credit_card_validator/credit_card_validator.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flux_validator_dart/flux_validator_dart.dart';
import 'package:mobx/mobx.dart';

import '../addCard_store.dart';

part 'card_validation.g.dart';

class CardValidation = _CardValidationBase with _$CardValidation;

abstract class _CardValidationBase with Store {
  
  var card = AddCardStore(
    numero_cartao: '',
    nome_impresso: '',
    apelido: '',
    validade: '',
    cvv: '',
    cpf_cnpj: '',
  );

  CreditCardValidator _ccValidator = CreditCardValidator();

  bool isValid(){
    if(validationNumeroCartao() == null && validationNomeImpresso() == null 
      && validationApelido() == null && validationValidade() == null 
      && validationCVV() == null && validationCPF_CNPJ() == null){
      
      return true;
    }
    return false;
  }

  validationNumeroCartao(){
    var _isValid = _ccValidator.validateCCNum(card.numero_cartao).isValid;
    if(card.numero_cartao.isEmpty){
      return 'Campo obrigatorio';
    }else if(card.numero_cartao.length < 14 || card.numero_cartao.length > 16){
      return 'Insira um número válido de 14 a 16 dígitos';
    }
    return null;
  }

  validationNomeImpresso(){
    if(card.nome_impresso == '' || card.nome_impresso.isEmpty){
      return 'Campo obrigatorio';
    }
    return null;
  }

  validationApelido(){
    if(card.apelido == '' || card.apelido.isEmpty){
      return 'Campo obrigatorio';
    }else if(card.apelido.length < 3){
      return 'Mínimo de 3 caracteres';
    }
    return null;
  }

  validationValidade(){
    bool _isValid = _ccValidator.validateExpDate(card.validade).isValid;
    if(card.validade == '' || card.validade.isEmpty){
      return 'Campo obrigatorio';
    }else if(!_isValid){
      return 'Insira uma data válida';
    }
    return null;
  }

  validationCVV(){
    if(card.cvv == '' || card.cvv.isEmpty){
      return 'Campo obrigatorio';
    }else if(card.cvv.length < 3 || card.cvv.length > 3){
      return 'Mínimo de 3 caracteres';
    }
    return null;
  }

  /// A validaão esta funcionando apenas para CPF
  /// Ela so ta funcionando com CPF valido
  /// Pode usar um Gerador de CPF online
  validationCPF_CNPJ(){
    if(card.cpf_cnpj == null || card.cpf_cnpj.isEmpty){
      return 'Campo obrigatorio';
    }else if(Validator.cpf(card.cpf_cnpj)){
      return 'Informe-nos um CPF válido';
    }
    return null;
  }

}