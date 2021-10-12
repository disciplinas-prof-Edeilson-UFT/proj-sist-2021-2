import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pscomidas/app/global/models/entities/product.dart';
import 'package:pscomidas/app/modules/restaurant/restaurant_service.dart';

class RestaurantServiceFirestore extends RestaurantService {
  @override
  Future<List<Product>> getProductsService(searchTitle) async {
    QuerySnapshot<Map<String, dynamic>> querySnapshot;

    if (searchTitle.isNotEmpty) {
      querySnapshot = await FirebaseFirestore.instance
          .collection('products')
          .where('name', isGreaterThanOrEqualTo: searchTitle)
          .get();
    } else {
      querySnapshot =
          await FirebaseFirestore.instance.collection('products').get();
    }
    return querySnapshot.docs
        .map((doc) => Product.fromMap(doc.data()))
        .toList();
  }
}
