import 'package:flutter/foundation.dart';
import 'package:mobx/mobx.dart';
import 'package:pscomidas/app/modules/order/class/orders.dart';

part 'order_store.g.dart';

class OrderStore = _OrderStoreBase with _$OrderStore;
abstract class _OrderStoreBase with Store {


  ObservableList<OrdersList> order =  ObservableList<OrdersList>();
  @action
  void incrementOrder(OrdersList data) => order.add(data);

}