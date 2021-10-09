// ignore_for_file: file_names

import 'package:flutter_modular/flutter_modular.dart';
import 'package:pscomidas/app/modules/form_payment/formPayment_page.dart';
import 'package:pscomidas/app/modules/form_payment/formPayment_store.dart';

class FormPaymentModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => FormPaymentStore()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => FormPaymentPage()),
  ];
}
