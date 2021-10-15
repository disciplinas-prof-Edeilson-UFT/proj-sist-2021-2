import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:pscomidas/app/global/models/entities/item.dart';
import 'package:pscomidas/app/global/models/entities/new_card.dart';
import 'package:pscomidas/app/global/models/entities/order.dart';
import 'package:pscomidas/app/global/repositories/order/order_repository.dart';
part 'cart_store.g.dart';

class CartStore = _CartStoreBase with _$CartStore;

abstract class _CartStoreBase with Store {
  final OrderRepository orderRepository = Modular.get<OrderRepository>();
  @observable
  List<Item> itens = [];

  List<NewCard> card = [
    NewCard(
      brand: 'Master',
      cpf: '123.456.789.10',
      fourLastNumbers: '5567.6875.2978.4587',
      holder: 'Fulano de Paula',
      nickname: 'Cartão Fulano',
      valid: '08/26',
      cvv: '879',
    ),
  ];

  @action
  void addItem(Item item) {
    itens.add(item);
  }

  void removeItem(Item item) {
    itens.remove(item);
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
