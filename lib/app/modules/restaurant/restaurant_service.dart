import 'package:pscomidas/app/global/models/entities/product.dart';
import 'package:pscomidas/app/global/models/entities/restaurant.dart';

abstract class RestaurantService {
  Future<List<Product>> getProductsService(
      String searchTitle, String restaurantId);

  Future<Restaurant> fetchRestaurant(String uid);
}
