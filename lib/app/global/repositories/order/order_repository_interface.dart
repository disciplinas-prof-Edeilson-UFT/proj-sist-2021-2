import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pscomidas/app/global/models/entities/order.dart';

abstract class IOrderRepository {
  Future<Order>? getOrder(Order pedido);
  Future<DocumentReference> cadastrarOrder(Order pedido);
  Future<void> ratingOrder(Order pedido, String comentario, String nota);
}
