import 'package:pscomidas/app/modules/order/components/track_order/pages/track_page.dart';
import 'package:pscomidas/app/modules/order/order_page.dart';
import 'package:pscomidas/app/modules/order/order_store.dart';
import 'package:flutter_modular/flutter_modular.dart';

class OrderModule extends Module {
  static String get routeName => '/order';
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => OrderStore()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => const OrderPage()),
    ChildRoute(TrackPage.trackRouteName, child: (_, args) => const TrackPage()),
  ];
}
