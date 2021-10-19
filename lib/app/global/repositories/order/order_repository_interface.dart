import 'package:pscomidas/app/global/models/entities/order.dart';

abstract class IOrderRepository {
  Future<Order>? getOrder(Order pedido);
  Future<bool> cadastrarOrder(Order pedido);
}
