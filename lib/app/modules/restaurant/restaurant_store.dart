import 'package:mobx/mobx.dart';
import 'package:pscomidas/app/global/models/entities/item.dart';
import 'package:pscomidas/app/global/models/entities/product.dart';
import 'package:pscomidas/app/modules/cart/cart_store.dart';

part 'restaurant_store.g.dart';

class RestaurantStore = _RestaurantStoreBase with _$RestaurantStore;

abstract class _RestaurantStoreBase with Store {
  _RestaurantStoreBase(this.cartStore);

  final CartStore cartStore;

  @observable
  List<Product> products = [
    Product(
      available: true,
      name: 'HAMBÚRGUER X-TUDO',
      price: 13.90,
      description:
          'Ingredientes: Pão, queijo, presunto, hambúrguer, milho, ovo, bacon',
    ),
    Product(
      available: true,
      name: 'TEMAKI DE SALMÃO',
      price: 24.0,
      description: 'Temaki de salmão com arroz japonês',
    ),
    Product(
      available: true,
      name: 'PIZZA DE CALABRESA',
      price: 49.90,
      description:
          'Molho especial + queijo mussarela + calabresa + cebola + orégano',
    ),
    Product(
      available: true,
      name: 'SHAWARMA MISTA DE CARNE',
      price: 22.99,
      description:
          'Pão sírio, creme de alho, carne, alface, tomate, cebola e batata frita',
    ),
    Product(
      available: true,
      name: 'CACHORRO QUENTE',
      price: 6.50,
      description:
          'Cachorro quente ao molho com molho de alho, batata palha e milho',
    ),
    Product(
      available: true,
      name: 'BRAVO BURGUER',
      price: 16.99,
      description: '150g de hambúrguer bovino 100% artesanal',
    ),
  ];

  @action
  Future<List<Product>> getProducts() async {
    return products;
  }

  void addItem(Item item) {
    cartStore.addItem(item);
  }
}
