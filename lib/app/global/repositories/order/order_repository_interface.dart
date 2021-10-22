import 'package:pscomidas/app/global/models/entities/order.dart';
import 'package:pscomidas/app/global/models/entities/rating.dart';

abstract class IOrderRepository {
  Future<Order>? getOrder(Order pedido);
  Future<bool> cadastrarOrder(Order pedido);
  Future<void> ratingOrder(Order pedido, Rating avaliacao);
}
