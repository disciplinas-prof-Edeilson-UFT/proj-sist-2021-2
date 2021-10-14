import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pscomidas/app/global/models/entities/product.dart';
import 'package:pscomidas/app/modules/restaurant/restaurant_service.dart';

class RestaurantServiceFirestore extends RestaurantService {
  @override
  Future<List<Product>> getProductsService(
      String searchTitle, String restaurantId) async {
    QuerySnapshot<Map<String, dynamic>> querySnapshot;

    // TODO: Restrição por restaurantId
    if (searchTitle.isNotEmpty) {
      querySnapshot = await FirebaseFirestore.instance
          .collection('products')
          .where('name', isGreaterThanOrEqualTo: searchTitle)
          .get();
    } else {
      querySnapshot = await FirebaseFirestore.instance
          .collection('products')
          .where('restaurant_id', isEqualTo: restaurantId)
          .get();
    }
    return querySnapshot.docs.map((doc) {
      Product product = Product.fromMap(doc.data(), doc.id);
      //product.productId = doc.id;
      return product;
    }).toList();
  }
}
