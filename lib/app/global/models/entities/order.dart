import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pscomidas/app/global/models/entities/item.dart';
import 'package:pscomidas/app/global/models/enums/order_status.dart';

class Order {
  final List<Item> itens;
  final double shipPrice;
  final double orderPrice;
  final OrderType? status;
  final DocumentReference? docid;

  Order({
    required this.itens,
    required this.shipPrice,
    required this.orderPrice,
    this.status,
    this.docid,
  });

  factory Order.fromDocument(DocumentSnapshot doc) {
    return Order(
      itens: doc['items'],
      shipPrice: doc['ship_price'],
      orderPrice: doc['order_price'],
      status: doc['status'],
    );
  }
}
