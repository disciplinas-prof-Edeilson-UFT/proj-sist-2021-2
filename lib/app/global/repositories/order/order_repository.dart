import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:pscomidas/app/global/models/entities/order.dart';
import 'package:pscomidas/app/global/models/enums/order_status.dart';
import 'package:pscomidas/app/global/repositories/order/order_repository_interface.dart';

class OrderRepository implements IOrderRepository {
  final FirebaseFirestore firestore;
  final FirebaseAuth auth;
  OrderRepository({required this.firestore, required this.auth});

  @override
  Future<Order>? getOrder(Order pedido) async {
    try {
      return await firestore
          .collection('order')
          .doc(pedido.docid.toString())
          .get()
          .then((DocumentSnapshot doc) {
        return Order.fromDocument(doc);
      });
    } catch (e) {
      throw Exception("Pedido não encontrado");
    }
  }

  @override
  Future<bool> cadastrarOrder(Order pedido) async {
    List<dynamic> itemID = [];
    try {
      for (var element in pedido.itens) {
        await firestore.collection('item').add({
          'quant': element.quantidade,
          'product_id': element.product.productId,
        }).then((value) {
          itemID.add(value.id);
          return true;
        }).catchError((error) {
          log("Falha ao adicionar $error");
          return false;
        });
      }

      await firestore.collection('order').add({
        'delivered': false,
        'items': [],
        'order_price': pedido.orderPrice,
        'restaurant_id': "Restaurante ABC",
        'ship_price': pedido.shipPrice,
        'status': OrderType.started.databaseString,
      }).then((value) async {
        await firestore.collection('order').doc(value.id).set({
          'items': itemID,
        }, SetOptions(merge: true)).then((value) {
          log('Items adicionados');
        });
        log(value.id);
      }).catchError((error) {
        log(error);
      });
    } catch (e) {
      throw Exception("Erro: $e");
    }
    return false;
  }
}
