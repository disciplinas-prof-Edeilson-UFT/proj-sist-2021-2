import 'package:pscomidas/app/global/models/entities/item.dart';
import 'package:pscomidas/app/global/models/enums/order_status.dart';

class Order {
  final List<Item> itens;
  final double shipPrice;
  final double orderPrice;
  final OrderType status;

  Order(
    this.itens,
    this.shipPrice,
    this.orderPrice,
    this.status,
  );
}
