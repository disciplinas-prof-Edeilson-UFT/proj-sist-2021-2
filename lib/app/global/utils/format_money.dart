import 'package:intl/intl.dart';

class FormatMoney {
  static String doubleToMoney(double price) {
    var money = NumberFormat('###.00', 'pt_BR');
    var format = price > 0 ? money.format(price) : '0,00';
    return 'R\$ ' + format;
  }
}
