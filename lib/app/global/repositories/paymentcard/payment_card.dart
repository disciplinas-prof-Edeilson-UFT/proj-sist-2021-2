import 'dart:developer';

import 'package:flutter_modular/flutter_modular.dart';
import 'package:pscomidas/app/global/models/entities/new_card.dart';
import 'package:pscomidas/app/global/repositories/paymentcard/payment_card_interface.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:pscomidas/app/modules/payments/payments_store.dart';

class PaymentCardRepository implements IPaymentCardRepository {
  final store = Modular.get<PaymentsStore>();
  final FirebaseFirestore firestore;
  final FirebaseAuth auth;
  PaymentCardRepository({required this.firestore, required this.auth});

  @override
  Future<void> addPaymentCard(NewCard card) async {
    List<dynamic> cartao = [];
    try {
      await firestore.collection('cards').add({
        'cardnumber': card.cardnumber,
        'cvv': card.cvv,
        'name': card.nome,
        'validade': card.validity,
      }).then((value) {
        cartao.add(value.id);
        log("Cartão adicionado com sucesso");
      });

      final User? user = auth.currentUser;
      final uid = user!.uid;

      return await firestore
          .collection('clients')
          .doc(uid)
          .set({'cards': cartao});
    } catch (e) {
      log("Falha ao adicionar $e");
    }
  }
}
