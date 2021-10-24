import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:pscomidas/app/global/models/entities/order.dart';
import 'package:pscomidas/app/global/models/enums/order_status.dart';
import 'package:pscomidas/app/global/repositories/order/order_repository.dart';

part 'order_store.g.dart';

class OrderStore = _OrderStoreBase with _$OrderStore;
abstract class _OrderStoreBase with Store {
  OrderRepository repository = Modular.get<OrderRepository>();

  ObservableList<Order> orderList = ObservableList<Order>();

  @action
  void incrementOrder(Order data) => orderList.add(data);

  @computed
  Future getTeste() async{
    Order? pedido = await repository.getOrder();
    if(orderList.isEmpty){
      orderList.add(pedido!);
    }else{
      var cont = 0;
      for(var i = 0; i < orderList.length; i++){
        if(orderList.elementAt(i) == pedido){
          break;
        }
      }
      if(cont == orderList.length) orderList.add(pedido!);
    }
  }
}