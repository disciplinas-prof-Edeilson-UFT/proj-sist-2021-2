import 'package:pscomidas/app/modules/order/order_page.dart';
import 'package:pscomidas/app/modules/order/order_store.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pscomidas/app/modules/order/track/order_details/order_details_page.dart';

class OrderModule extends Module {
  static String get routeName => '/order';
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => OrderStore()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => const OrderPage()),
    ChildRoute(OrderDetailsPage.orderDetailsRouteName, child: (_, args) => const OrderDetailsPage()),
  ];
}
