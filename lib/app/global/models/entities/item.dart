import 'package:pscomidas/app/global/models/entities/product.dart';

class Item {
  final Product product;
  final int quantidade;
  final String itemID;

  Item(
    this.product,
    this.quantidade,
    this.itemID,
  );
}
