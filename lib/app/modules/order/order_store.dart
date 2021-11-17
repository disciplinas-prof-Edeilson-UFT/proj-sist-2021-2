import 'package:mobx/mobx.dart';
import 'package:pscomidas/app/global/models/entities/order.dart';
import 'package:pscomidas/app/modules/cart/cart_store.dart';

part 'order_store.g.dart';

class OrderStore = _OrderStoreBase with _$OrderStore;

abstract class _OrderStoreBase with Store {
  final CartStore cartStore;

  _OrderStoreBase(this.cartStore);

  Order? get order {
    return cartStore.listaPedido;
  }
}
