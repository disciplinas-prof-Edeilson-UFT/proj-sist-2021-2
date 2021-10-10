import 'package:pscomidas/app/global/models/entities/product.dart';

abstract class RestaurantService {
  Future<List<Product>> getProductsService(searchTitle);
}
