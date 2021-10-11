import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:pscomidas/app/global/models/entities/item.dart';
import 'package:pscomidas/app/global/models/entities/order.dart';
import 'package:pscomidas/app/global/models/entities/product.dart';
import 'package:pscomidas/app/global/models/enums/order_status.dart';
import 'package:pscomidas/app/global/repositories/order/order_repository.dart';
part 'cart_store.g.dart';

class CartStore = _CartStoreBase with _$CartStore;

abstract class _CartStoreBase with Store {
  final OrderRepository orderRepository = Modular.get<OrderRepository>();

  @observable
  List<Item> itens = [
    Item(
      Product(
        available: true,
        name: 'HAMBÚRGUER X-TUDO',
        price: 13.90,
        imgUrl:
            'https://firebasestorage.googleapis.com/v0/b/ps-comidas.appspot.com/o/burguer.jpeg?alt=media&token=bdd577aa-d3da-47ef-b827-0ceee0d43698',
        description:
            'Ingredientes: Pão, queijo, presunto, hambúrguer, milho, ovo, bacon',
        productID: '123',
      ),
      25,
      'f158G',
    ),
    Item(
      Product(
        available: true,
        name: 'HAMBÚRGUER X-TUDO',
        price: 13.90,
        imgUrl:
            'https://firebasestorage.googleapis.com/v0/b/ps-comidas.appspot.com/o/burguer.jpeg?alt=media&token=bdd577aa-d3da-47ef-b827-0ceee0d43698',
        description:
            'Ingredientes: Pão, queijo, presunto, hambúrguer, milho, ovo, bacon',
      ),
      2,
      'f158G',
    ),
    Item(
      Product(
        available: true,
        name: 'HAMBÚRGUER X-TUDO',
        price: 13.90,
        imgUrl:
            'https://firebasestorage.googleapis.com/v0/b/ps-comidas.appspot.com/o/burguer.jpeg?alt=media&token=bdd577aa-d3da-47ef-b827-0ceee0d43698',
        description:
            'Ingredientes: Pão, queijo, presunto, hambúrguer, milho, ovo, bacon',
      ),
      2,
      'f158G',
    ),
    Item(
      Product(
        available: true,
        name: 'HAMBÚRGUER X-TUDO',
        price: 13.90,
        imgUrl:
            'https://firebasestorage.googleapis.com/v0/b/ps-comidas.appspot.com/o/burguer.jpeg?alt=media&token=bdd577aa-d3da-47ef-b827-0ceee0d43698',
        description:
            'Ingredientes: Pão, queijo, presunto, hambúrguer, milho, ovo, bacon',
      ),
      2,
      'f158G',
    ),
    Item(
      Product(
        available: true,
        name: 'HAMBÚRGUER X-TUDO',
        price: 13.90,
        imgUrl:
            'https://firebasestorage.googleapis.com/v0/b/ps-comidas.appspot.com/o/burguer.jpeg?alt=media&token=bdd577aa-d3da-47ef-b827-0ceee0d43698',
        description:
            'Ingredientes: Pão, queijo, presunto, hambúrguer, milho, ovo, bacon',
      ),
      2,
      'f158G',
    ),
    Item(
      Product(
        available: true,
        name: 'HAMBÚRGUER X-TUDO',
        price: 13.90,
        imgUrl:
            'https://firebasestorage.googleapis.com/v0/b/ps-comidas.appspot.com/o/burguer.jpeg?alt=media&token=bdd577aa-d3da-47ef-b827-0ceee0d43698',
        description:
            'Ingredientes: Pão, queijo, presunto, hambúrguer, milho, ovo, bacon',
      ),
      2,
      'f158G',
    ),
    Item(
      Product(
        available: true,
        name: 'HAMBÚRGUER X-TUDO',
        price: 13.90,
        imgUrl:
            'https://firebasestorage.googleapis.com/v0/b/ps-comidas.appspot.com/o/burguer.jpeg?alt=media&token=bdd577aa-d3da-47ef-b827-0ceee0d43698',
        description:
            'Ingredientes: Pão, queijo, presunto, hambúrguer, milho, ovo, bacon',
      ),
      2,
      'f158G',
    ),
    Item(
      Product(
        available: true,
        name: 'HAMBÚRGUER X-TUDO',
        price: 13.90,
        imgUrl:
            'https://firebasestorage.googleapis.com/v0/b/ps-comidas.appspot.com/o/burguer.jpeg?alt=media&token=bdd577aa-d3da-47ef-b827-0ceee0d43698',
        description:
            'Ingredientes: Pão, queijo, presunto, hambúrguer, milho, ovo, bacon',
      ),
      2,
      'f158G',
    ),
  ];

  @computed
  double get total {
    double subtotal = 0;
    itens.forEach((item) {
      subtotal += (item.quantidade * item.product.price!);
    });
    //Calculo do valor final do pedido
    //O valor vai ser calculado em outro momento
    return subtotal + 12.5;
  }

  Future cadastroTeste() async {
    Order pedido = Order(
      itens: itens,
      shipPrice: 10.55,
      orderPrice: 20.55,
      status: OrderType.doing,
    );
    await orderRepository.cadastrarOrder(pedido);
  }
}
