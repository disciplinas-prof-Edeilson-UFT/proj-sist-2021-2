import 'package:intl/intl.dart';

class FormatMoney {
  static String doubleToMoney(double price) {
    var money = NumberFormat('###.00', 'pt_BR');
    return money.format(price);
  }
}
