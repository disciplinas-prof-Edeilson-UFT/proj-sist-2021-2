import 'package:pscomidas/app/modules/order/order_Page.dart';
import 'package:pscomidas/app/modules/order/order_store.dart';
import 'package:flutter_modular/flutter_modular.dart';

class OrderModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => OrderStore()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => OrderPage()),
  ];
}
