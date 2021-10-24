import 'package:pscomidas/app/modules/cart/cart_page.dart';
import 'package:pscomidas/app/modules/cart/cart_store.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pscomidas/app/modules/cart/components/payment/pages/payment_page.dart';

class CartModule extends Module {
  static String routeName = '/cart';
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => CartStore()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => const CartPage()),
    ChildRoute(PaymentPage.paymentRouteName,
        child: (_, args) => const PaymentPage())
  ];
}
