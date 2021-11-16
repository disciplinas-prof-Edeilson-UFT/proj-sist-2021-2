import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:pscomidas/app/global/models/entities/delivery_at.dart';
import 'package:pscomidas/app/global/models/entities/item.dart';
import 'package:pscomidas/app/global/models/entities/new_card.dart';
import 'package:pscomidas/app/global/models/entities/order.dart';
import 'package:pscomidas/app/global/repositories/order/order_repository.dart';
part 'cart_store.g.dart';

class CartStore = _CartStoreBase with _$CartStore;

abstract class _CartStoreBase with Store {
  final OrderRepository orderRepository = Modular.get<OrderRepository>();
  @observable
  ObservableList<Item> itens = <Item>[].asObservable();

  @observable
  ObservableList<Item> itensPedido = <Item>[].asObservable();

  List<NewCard> card = [];

  List<DeliveryAt> address = [];

  @observable
  Order? listaPedido;

  @action
  void addItem(Item item) {
    itens.add(item);
  }

  @action
  void removeItem(String iditemremovido) {
    itens.removeWhere((element) {
      return element.itemid == iditemremovido;
    });
  }

  @action
  void editItem(Item itemEditing) {
    addItem(itemEditing);
    removeItem(itemEditing.itemid);
  }

  @computed
  double get total {
    double subtotal = 0;
    for (var item in itens) {
      subtotal += (item.quantidade * item.product.price!);
    }
    return subtotal + 12.5;
  }

  @action
  void transferirItens() {
    for (var i = 0; i < itens.length; i++) {
      itensPedido.add(itens[i]);
    }
  }

  @action
  void cleaningItemsCart() {
    itens.clear();
  }

  @action
  Future cadastroTeste() async {
    transferirItens();
    Order pedido = Order(
      itens: itensPedido,
      shipPrice: 12.50,
      orderPrice: total - 12.5,
    );
    var response = await orderRepository.cadastrarOrder(pedido);

    listaPedido = Order(
      itens: itensPedido,
      orderPrice: total,
      shipPrice: 12.50,
      docid: response,
    );
    cleaningItemsCart();
  }
}
