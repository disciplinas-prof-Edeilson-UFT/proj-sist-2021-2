import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pscomidas/app/modules/auth/auth_module.dart';
import 'package:pscomidas/app/modules/cart/cart_module.dart';
import 'package:pscomidas/app/global/repositories/order/order_repository.dart';
import 'package:pscomidas/app/modules/cart/cart_store.dart';
import 'package:pscomidas/app/modules/cart/components/payment/pages/payment_page.dart';
import 'package:pscomidas/app/modules/client_address/client_address_store.dart';
import 'package:pscomidas/app/modules/home/store/home_store.dart';
import 'package:pscomidas/app/modules/order/order_module.dart';
import 'package:pscomidas/app/modules/order/order_store.dart';
import 'package:pscomidas/app/modules/register_client/register_client_module.dart';
import 'modules/restaurant/restaurant_module.dart';
import 'package:pscomidas/app/modules/home/home_module.dart';
import 'package:pscomidas/app/modules/restaurant/restaurant_module.dart';
import 'modules/auth/auth_module.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => OrderRepository(
        firestore: FirebaseFirestore.instance, auth: FirebaseAuth.instance)),
    Bind.lazySingleton((i) => CartStore()),
    Bind.lazySingleton((i) => HomeStore()),
    Bind.lazySingleton((i) => OrderStore()),
    Bind.lazySingleton((i) => ClientAddressStore()),
  ];

  @override
  final List<ModularRoute> routes = [
    ModuleRoute(Modular.initialRoute, module: HomeModule()),
    ModuleRoute(RestaurantModule.routeName, module: RestaurantModule()),
    ModuleRoute(CartModule.routeName, module: CartModule()),
    ModuleRoute(AuthModule.routeName, module: AuthModule()),
    ModuleRoute(RegisterClientModule.routeName, module: RegisterClientModule()),
    ModuleRoute(OrderModule.routeName, module: OrderModule()),
    ChildRoute(PaymentPage.paymentRouteName,
        child: (_, args) => const PaymentPage()),
    // ModuleRoute(OrderModule.routeName, module: OrderModule()),
  ];
}
