import 'package:flutter_modular/flutter_modular.dart';

class ButtonSideBar {
  static final buttons = {
    'Produtos': {
      'navigator': () => Modular.to.navigate('restaurant_home/products'),
    },
    'Pedidos': {
      'navigator': () => Modular.to.navigate('restaurant_home/products'),
    },
    'Avaliações': {
      'navigator': () => Modular.to.navigate('restaurant_home/products'),
    },
    'Sair': {
      'navigator': () => Modular.to.navigate('restaurant_home/products'),
    },
  };
}
