import 'package:pscomidas/app/global/models/enums/filter.dart';

class Restaurant implements Exception {
  final String restaurantId;
  final double? avaliation;
  final String category;
  final Map<String, dynamic>? cupom;
  final double deliveryPrice;
  final String deliveryPlan;
  final double distance;
  final String estimatedDelivery;
  final String phone;
  final String image;
  final bool isChampion;
  final int orders;
  final String socialName;
  final String nameOwner;
  final String phoneOwner;
  final String emailOwner;
  final String password;
  final String cep;
  final String city;
  final String state;
  final String address;
  final String district;
  final String number;
  final String complement;

  Restaurant(
    this.restaurantId, {
    this.avaliation,
    required this.category,
    this.cupom,
    required this.deliveryPrice,
    required this.distance,
    required this.estimatedDelivery,
    required this.deliveryPlan,
    required this.phone,
    required this.image,
    required this.isChampion,
    required this.orders,
    required this.socialName,
    required this.nameOwner,
    required this.phoneOwner,
    required this.emailOwner,
    required this.password,
    required this.cep,
    required this.city,
    required this.state,
    required this.address,
    required this.district,
    required this.number,
    required this.complement,
  });
//pegando os dados do servidor

  static _throw() {
    throw 'Null value exception';
  }

  static Restaurant fromMap(id, Map<String, dynamic> map) {
    return Restaurant(
      id,
      avaliation: map['avaliation'],
      category: map['category'] ?? _throw(),
      cupom: map['cupom'],
      deliveryPrice: map['deliveryPrice'],
      deliveryPlan: map['deliveryPlan'] ?? 'Plano Entrega',
      distance: map['distance'] ?? _throw(),
      estimatedDelivery: map['estimatedDelivery'] ?? _throw(),
      phone: map['phoneRestaurant'] ?? '',
      image: map['image'] ?? _throw(),
      isChampion: map['isChampion'] ?? false,
      orders: map['orders'] ?? _throw(),
      socialName: map['socialName'] ?? _throw(),
      nameOwner: map['nameOwner'] ?? '',
      phoneOwner: map['phoneOwner'] ?? '',
      emailOwner: map['emailOwner'] ?? '',
      password: map['password'] ?? '',
      cep: map['CEP'] ?? '',
      city: map['city'] ?? '',
      state: map['state'] ?? '',
      address: map['address'] ?? '',
      district: map['district'] ?? '',
      number: map['number'] ?? '',
      complement: map['complement'] ?? '',
    );
  }

  getByFilter(FilterType filter) {
    switch (filter) {
      case FilterType.avaliation:
        return -(avaliation ?? 0);
      case FilterType.freeShipping:
        return deliveryPrice;
      case FilterType.discountCoupon:
        if (cupom == null) {
          return 999;
        }
        if (cupom!['tipo'] == 'entrega_gratis') {
          return -999;
        }
        return -cupom!['valor'];
      case FilterType.shortestDistance:
        return distance;
      default:
        return socialName;
    }
  }
}
