import 'package:pscomidas/app/global/models/entities/order.dart';

abstract class IOrderRepository {
  Future<Order>? getOrder();
  Future<bool> cadastrarOrder(Order pedido);
}