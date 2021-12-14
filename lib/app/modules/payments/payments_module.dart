import 'package:pscomidas/app/modules/payments/payments_page.dart';
import 'package:pscomidas/app/modules/payments/payments_store.dart';
import 'package:flutter_modular/flutter_modular.dart';

class PaymentsModule extends Module {
  static String get routeName => '/manage_payments';
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => PaymentsStore()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => const PaymentsPage()),
  ];
}
