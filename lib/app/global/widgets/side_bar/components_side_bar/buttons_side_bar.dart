import 'package:pscomidas/app/modules/restaurant_home/pages/plans/restaurant_plan_page.dart';

class ButtonSideBar {
  static final buttons = {
    'Produtos': {
      'navigator': 'products',
    },
    'Pedidos': {
      'navigator': 'orders',
    },
    'Avaliações': {
      'navigator': 'avaliations',
    },
    'Planos': {
      'navigator': RestaurantPlanPage.routeName,
    },
    'Sair': {
      'navigator': '/',
    },
  };
}
