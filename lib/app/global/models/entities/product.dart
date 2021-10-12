class Product {
  final bool? available;

  final List<dynamic>? categories;

  final List<String>? categories;

  final String? description;
  final String? imgUrl;
  final String? name;
  final double? price;
  final String? restaurantId;

  final String? productID;

  Product({
    this.available,
    this.categories,
    this.description,
    this.imgUrl,
    this.name,
    this.price,
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

  static Product fromMap(Map<String, dynamic> map) {
    return Product(
      available: map['available'],
      name: map['name'],
      categories: map['categories'],
      imgUrl: map['img'],
      description: map['description'],
      price: map['price'],
      restaurantId: map['restaurant_id'],
    );
  }

    this.productID,
  });
}
