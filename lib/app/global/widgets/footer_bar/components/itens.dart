import 'package:pscomidas/app/modules/restaurant_home/pages/product/product_page.dart';
import 'package:pscomidas/app/modules/restaurant_home/restaurant_home_module.dart';
import 'package:pscomidas/app/modules/restaurant_register/restaurant_register_module.dart';
import 'package:pscomidas/app/modules/restaurant_register/restaurant_register_page.dart';

class SectionItens {
  static const List<Map<String, String>> psFood = [
    {"Name": 'Fale conosco',
      "Route" : ''},
  ];
  static List<Map<String, String>> partners = [
    {"Name" : 'Cadastre seu restaurante',
      "Route" :  RestaurantRegisterModule.routeName + RestaurantRegisterPage.routeName},
    {"Name" : 'Psfood empresas', 
      "Route" : RestaurantHomeModule.routeName + ProductPage.routeName},
  ];
}