import 'package:pscomidas/app/global/utils/auth_guard.dart';
import 'package:pscomidas/app/global/widgets/not_found/not_found_page.dart';
import 'package:pscomidas/app/modules/cart/cart_store.dart';
import 'package:pscomidas/app/modules/order/components/details_page/pages/track_page.dart';
import 'package:pscomidas/app/modules/order/order_page.dart';
import 'package:pscomidas/app/modules/order/order_store.dart';
import 'package:flutter_modular/flutter_modular.dart';

class OrderModule extends Module {
  static String get routeName => '/Order';
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => CartStore()),
    Bind.lazySingleton((i) => OrderStore(i.get())),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/',
        child: (_, args) => const OrderPage(), guards: [ClientGuard()]),
    ChildRoute(TrackPage.trackRouteName, child: (_, args) => const TrackPage()),
    WildcardRoute(child: (context, args) => const NotFoundPage()),
  ];
}
