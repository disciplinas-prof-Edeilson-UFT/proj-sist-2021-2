import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:pscomidas/app/global/models/entities/order.dart';
import 'package:pscomidas/app/global/repositories/order/order_repository_interface.dart';

class OrderRepository implements IOrderRepository {
  final FirebaseFirestore firestore;
  final FirebaseAuth auth;
  OrderRepository({required this.firestore, required this.auth});

  @override
  Future<Order>? getOrder() async {
    try {
      return await firestore
          .collection('order')
          .doc('ADjDH5NWXtMVKGMfi4LdOUbQWB03')
          .get()
          .then((DocumentSnapshot doc) {
        return Order.fromDocument(doc);
      });
    } catch (e) {
      throw Exception("Pedido não encontrado");
    }
  }
}
