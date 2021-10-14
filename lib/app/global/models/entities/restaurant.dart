class Restaurant {
  final String restaurantId;
  final double? avaliation;
  final String category;
  final Map<String, dynamic>? cupom;
  final double deliveryPrice;
  final double distance;
  final String estimatedDelivery;
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
    required this.image,
    required this.isChampion,
    required this.orders,
    required this.socialName,
  });
}
