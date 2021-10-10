import 'package:flutter_modular/flutter_modular.dart';
import 'package:pscomidas/app/modules/cart/cart_store.dart';
// import 'package:pscomidas/app/modules/cart/pages/add_card/add_card_page.dart';
import 'package:pscomidas/app/modules/cart/pages/form_payment/form_payment_page.dart';
import 'package:pscomidas/app/modules/cart/pages/form_payment/form_payment_store.dart';
import 'package:pscomidas/app/modules/restaurant/restaurant_module.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.singleton((i) => CartStore()),
    Bind.lazySingleton((i) => FormPaymentStore()),
  ];

  @override
  final List<ModularRoute> routes = [
    ModuleRoute(Modular.initialRoute, module: RestaurantModule()),
    ChildRoute(FormPaymentPage.routeName,
        child: (_, args) => const FormPaymentPage()),
    //TODO adicionar rota de adição de cartão
  ];
}
