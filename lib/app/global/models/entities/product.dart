class Product {
  final bool? available;
  final String? categories;
  final String? description;
  final String? imgUrl;
  final String? name;
  final double? price;
  final String? restaurantId;
  late final String? productId;

  Product({
    this.available,
    this.categories,
    this.description,
    this.imgUrl,
    this.name,
    this.price,
    this.productId,
    this.restaurantId,
  });

  Map<String, dynamic> toMap() {
    return {
      'available': available,
      'name': name,
      'categories': categories,
      'img': imgUrl,
      'description': description,
      'price': price,
      'restaurantId': restaurantId,
    };
  }

  static Product fromMap(Map<String, dynamic> map, String productId) {
    return Product(
      available: map['available'],
      name: map['name'],
      categories: map['categories'],
      imgUrl: map['img'],
      description: map['description'],
      price: map['price'],
      restaurantId: map['restaurant_id'],
      productId: map['product_id'],
    );
  }
}
