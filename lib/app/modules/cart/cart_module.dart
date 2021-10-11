import 'package:pscomidas/app/modules/cart/cart_page.dart';
import 'package:pscomidas/app/modules/cart/cart_store.dart';
import 'package:flutter_modular/flutter_modular.dart';

class CartModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => CartStore()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => const CartPage()),
    //TODO adicionar rota de adição de cartão
  ];
}
