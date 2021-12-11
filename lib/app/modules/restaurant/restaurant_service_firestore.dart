import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pscomidas/app/global/models/entities/product.dart';
import 'package:pscomidas/app/global/models/entities/restaurant.dart';
import 'package:pscomidas/app/modules/restaurant/restaurant_service.dart';

class RestaurantServiceFirestore extends RestaurantService {
  final productsCollection = FirebaseFirestore.instance.collection('products');

  final restaurantCollection =
      FirebaseFirestore.instance.collection('restaurant');

  @override
  Future<Restaurant> fetchRestaurant(String uid) async {
    try {
      final response = await restaurantCollection.doc(uid).get();
      return Restaurant.fromMap(uid, response.data()!);
    } on Exception catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Future<List<Product>> getProductsService(
      String searchTitle, String restaurantId) async {
    QuerySnapshot<Map<String, dynamic>> querySnapshot;

    querySnapshot = await productsCollection
        .where('name', isGreaterThanOrEqualTo: searchTitle)
        .where('restaurant_id', isEqualTo: restaurantId)
        .get();

    return querySnapshot.docs.map((doc) {
      Product product = Product.fromMap(doc.data(), doc.id);
      return product;
    }).toList();
  }
}
