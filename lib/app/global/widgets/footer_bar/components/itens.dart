import 'package:pscomidas/app/modules/restaurant_home/pages/product/product_page.dart';
import 'package:pscomidas/app/modules/restaurant_home/restaurant_home_module.dart';
import 'package:pscomidas/app/modules/restaurant_register/restaurant_register_module.dart';
import 'package:pscomidas/app/modules/restaurant_register/restaurant_register_page.dart';

class Itens {
  static const List<Map<String, String>> ifood = [
    {"Name": 'Fale conosco',
      "Route" : ''},
  ];
  static List<Map<String, String>> descubra = [
    {"Name" : 'Cadastre seu Restaurante',
      "Route" :  RestaurantRegisterModule.routeName + RestaurantRegisterPage.routeName},
    {"Name" : 'Psfood Empresas', 
      "Route" : RestaurantHomeModule.routeName + ProductPage.routeName},
  ];
}