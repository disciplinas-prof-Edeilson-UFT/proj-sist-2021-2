import 'package:flutter/foundation.dart';
import 'package:mobx/mobx.dart';
import 'package:pscomidas/app/modules/order/%5BDELETAR%5D%20class/orders.dart';

part 'order_store.g.dart';

class OrderStore = _OrderStoreBase with _$OrderStore;
abstract class _OrderStoreBase with Store {

  
  @observable 
  ObservableList<OrdersList> order = [
    OrdersList(
      restaurante: 'MacDonalds',
      id: '9999',
      previsao: '15:30',
      status: 'Em preparo'
    ),
    OrdersList(
      restaurante: 'Podrão do ze da esquina',
      id: '9989',
      previsao: '12:30',
      status: 'A caminho'
    ),
    OrdersList(
      restaurante: 'Laricão',
      id: '1989',
      previsao: '11:30',
      status: 'Entregador chogou'
    ),
  ].asObservable();

}