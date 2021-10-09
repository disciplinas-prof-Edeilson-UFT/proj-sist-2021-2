import 'package:pscomidas/app/modules/cart/cart_page.dart';
import 'package:pscomidas/app/modules/cart/cart_store.dart';
import 'package:flutter_modular/flutter_modular.dart';
// import 'package:pscomidas/app/modules/cart/pages/add_card/add_card_page.dart';
import 'package:pscomidas/app/modules/cart/pages/add_card/add_card_store.dart';
import 'package:pscomidas/app/modules/cart/pages/form_payment/form_payment_page.dart';
import 'package:pscomidas/app/modules/cart/pages/form_payment/form_payment_store.dart';

class CartModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => CartStore()),
    Bind.lazySingleton((i) => FormPaymentStore()),
    Bind.lazySingleton((i) => AddCardStore())
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => const CartPage()),
    ChildRoute(FormPaymentPage.routeName,
        child: (_, args) => const FormPaymentPage()),
    //TODO adicionar rota de adição de cartão
  ];
}
