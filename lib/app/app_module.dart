import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pscomidas/app/global/repositories/order/order_repository.dart';
import 'package:pscomidas/app/modules/cart/cart_store.dart';
import 'package:pscomidas/app/modules/cart/components/payment/pages/payment_page.dart';
import 'package:pscomidas/app/modules/home/store/home_store.dart';
import 'package:pscomidas/app/modules/order/order_module.dart';
import 'package:pscomidas/app/modules/order/order_store.dart';
import 'modules/restaurant/restaurant_module.dart';
import 'package:pscomidas/app/modules/cart/cart_module.dart';
import 'package:pscomidas/app/modules/home/home_module.dart';
import 'package:pscomidas/app/modules/restaurant/restaurant_module.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.singleton((i) => OrderRepository(
        firestore: FirebaseFirestore.instance, auth: FirebaseAuth.instance)),
    Bind.singleton((i) => CartStore()),
    Bind.singleton((i) => HomeStore()),
    Bind.singleton((i) => OrderStore()),
  ];

  @override
  final List<ModularRoute> routes = [
    ModuleRoute(Modular.initialRoute, module: HomeModule()),
    ModuleRoute(RestaurantModule.routeName, module: RestaurantModule()),
    ModuleRoute(CartModule.routeName, module: CartModule()),
    ModuleRoute(OrderModule.routeName, module: OrderModule()),
    ChildRoute(PaymentPage.paymentRouteName,
        child: (_, args) => const PaymentPage()),
    // ModuleRoute(OrderModule.routeName, module: OrderModule()),
  ];
}
