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

  List<NewCard> card = [];

  List<DeliveryAt> address = [];

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

  Future cadastroTeste() async {
    Order pedido = Order(
      itens: itens,
      shipPrice: 12.50,
      orderPrice: total - 12.5,
    );
    await orderRepository.cadastrarOrder(pedido);
  }
}
