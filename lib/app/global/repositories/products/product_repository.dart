import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pscomidas/app/global/models/entities/product.dart';
import 'package:pscomidas/app/global/repositories/products/product_repository_interface.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pscomidas/app/modules/restaurant_home/restaurant_home_store.dart';

class ProductRepository implements IProductRepository {
  final store = Modular.get<RestaurantHomeStore>();

  ProductRepository();

  @override
  Future<void> cadastrarProduct(Product produto) async {
    try {
      await FirebaseFirestore.instance.collection('products').add({
        //TODO: Passar a imagem url para o banco de dados
        'available': true,
        'categories': produto.categories,
        'description': produto.description,
        'name': produto.name,
        'price': produto.price,
        'restaurant_id': produto.restaurantId,
      }).then((value) => store.id = value.id);
      productSetImage(store.imgPath);
    } catch (e) {
      throw Exception("Erro: $e");
    }
  }

  @override
  Future<void> productSetImage(dynamic e) async {
    if (e.type != 'image/jpeg' && e.type != 'image/png') {
      return;
    }
    store.prodPic = '';
    String imgUrl;
    try {
      imgUrl = await FirebaseStorage.instance
          .ref('product_image/${store.id}')
          .putBlob(e)
          .then((task) => task.ref.getDownloadURL());
      store.prodPic = imgUrl;
    } catch (e) {
      return;
    }
    await FirebaseFirestore.instance
        .collection('products')
        .doc(store.id)
        .update({'image': imgUrl});
  }
}
