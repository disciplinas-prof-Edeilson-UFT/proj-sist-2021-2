import 'package:pscomidas/app/global/models/entities/product.dart';

abstract class IProductRepository {
  void cadastrarProduct(Product produto);
  Future<void> productSetImage(dynamic e);
  Future<List<Product>> getProductsService(String restaurantId);
}
