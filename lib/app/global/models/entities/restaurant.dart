class Restaurant {
  final String restaurantId;
  final double? avaliation;
  final String category;
  final Map<String, dynamic>? cupom;
  final double deliveryPrice;
  final double distance;
  final String estimatedDelivery;
  final String phone;
  final String image;
  final bool isChampion;
  final int orders;
  final String socialName;

  Restaurant(
    this.restaurantId, {
    this.avaliation,
    required this.category,
    this.cupom,
    required this.deliveryPrice,
    required this.distance,
    required this.estimatedDelivery,
    required this.phone,
    required this.image,
    required this.isChampion,
    required this.orders,
    required this.socialName,
  });

  static Restaurant fromMap(id, Map<String, dynamic> map) {
    return Restaurant(
      id,
      avaliation: map['avaliation'],
      category: map['category'],
      cupom: map['cupom'],
      deliveryPrice: map['delivery_price'],
      distance: map['distance'],
      estimatedDelivery: map['estimated_delivery'],
      phone: map['phone_restaurant'],
      image: map['image'],
      isChampion: map['isChampion'],
      orders: map['orders'],
      socialName: map['social_name'],
    );
  }
}
