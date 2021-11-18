import 'dart:developer';

import 'package:pscomidas/app/global/models/entities/product.dart';
import 'package:pscomidas/app/global/repositories/product/product_repository_interface.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ProductRepository implements IProductRepository {
  final FirebaseFirestore firestore;
  final FirebaseAuth auth;
  ProductRepository({required this.firestore, required this.auth});

  @override
  void cadastrarProduct(Product produto) async {
    try {
      await firestore.collection('product').add({
        'available': produto.available,
        'categories': produto.categories,
        'description': produto.description,
        'img': produto.imgUrl,
        'name': produto.name,
        'price': produto.price,
        'restaurant_id': produto.restaurantId,
      }).then((value) => log('Produto adicionado $value'));
    } catch (e) {
      throw Exception("Erro: $e");
    }
  }
}
