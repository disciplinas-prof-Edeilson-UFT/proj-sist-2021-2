import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'package:pscomidas/app/global/repositories/order/order_repository.dart';

import 'package:pscomidas/app/modules/cart/cart_store.dart';
import 'package:pscomidas/app/modules/restaurant/restaurant_module.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.singleton((i) => OrderRepository(
        firestore: FirebaseFirestore.instance, auth: FirebaseAuth.instance)),
    Bind.singleton((i) => CartStore()),
  ];

  @override
  final List<ModularRoute> routes = [
    ModuleRoute(Modular.initialRoute, module: RestaurantModule()),

    //TODO adicionar rota de adição de cartão
  ];
}
