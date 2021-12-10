import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pscomidas/app/global/repositories/products/product_repository.dart';
import 'package:pscomidas/app/modules/auth/auth_module.dart';
import 'package:pscomidas/app/modules/cart/cart_module.dart';
import 'package:pscomidas/app/global/repositories/order/order_repository.dart';
import 'package:pscomidas/app/modules/cart/cart_store.dart';
import 'package:pscomidas/app/modules/cart/components/payment/pages/payment_page.dart';
import 'package:pscomidas/app/modules/home/store/home_store.dart';
import 'package:pscomidas/app/modules/order/components/details_page/pages/track_page.dart';
import 'package:pscomidas/app/modules/order/order_module.dart';
import 'package:pscomidas/app/modules/order/order_store.dart';
import 'package:pscomidas/app/modules/register_client/register_client_module.dart';
import 'package:pscomidas/app/modules/restaurant_home/restaurant_home_module.dart';
import 'package:pscomidas/app/modules/restaurant_home/restaurant_home_store.dart';
import 'package:pscomidas/app/modules/restaurant_register/restaurant_register_module.dart';
import 'package:pscomidas/app/modules/restaurant_register/restaurant_register_store.dart';
import 'modules/restaurant/restaurant_module.dart';
import 'package:pscomidas/app/modules/home/home_module.dart';
import 'package:pscomidas/app/modules/restaurant/restaurant_module.dart';
import 'modules/restaurant_register/restaurant_register_store.dart';
import 'modules/update_client_data/update_client_data_module.dart';
import 'modules/auth/auth_module.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.singleton((i) => OrderRepository(
        firestore: FirebaseFirestore.instance, auth: FirebaseAuth.instance)),
    Bind.singleton((i) => CartStore()),
    Bind.singleton((i) => HomeStore()),
    Bind.singleton((i) => OrderStore(i.get<CartStore>())),
    Bind.singleton((i) => RestaurantHomeStore()),
    Bind.singleton((i) => RestaurantRegisterStore()),
    Bind.singleton((i) => ProductRepository()),
  ];

  @override
  final List<ModularRoute> routes = [
    ModuleRoute(Modular.initialRoute, module: HomeModule()),
    ModuleRoute(RestaurantModule.routeName, module: RestaurantModule()),
    ModuleRoute(CartModule.routeName, module: CartModule()),
    ModuleRoute(RestaurantRegisterModule.routeName,
        module: RestaurantRegisterModule()),
    ModuleRoute(AuthModule.routeName, module: AuthModule()),
    ModuleRoute(RegisterClientModule.routeName, module: RegisterClientModule()),
    ModuleRoute(RestaurantHomeModule.routeName, module: RestaurantHomeModule()),
    ChildRoute(PaymentPage.paymentRouteName,
        child: (_, args) => const PaymentPage()),
    ModuleRoute(OrderModule.routeName, module: OrderModule()),
    ChildRoute(TrackPage.trackRouteName, child: (_, args) => const TrackPage()),
    ModuleRoute(UpdateClientDataModule.routeName,
        module: UpdateClientDataModule()),
  ];
}
