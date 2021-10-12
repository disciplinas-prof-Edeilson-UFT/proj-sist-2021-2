import 'package:mobx/mobx.dart';
import 'package:pscomidas/app/global/models/entities/item.dart';

part 'cart_store.g.dart';

class CartStore = _CartStoreBase with _$CartStore;

abstract class _CartStoreBase with Store {
  @observable
  List<Item> itens = [];

  @action
  void addItem(Item item) {
    itens.add(item);
  }
}
