import 'package:pscomidas/app/global/models/entities/delivery_at.dart';

class Cliente {
  final String name;
  final String cpf;
  final String? uid;
  final String email;
  final String phone;
  final DeliveryAt? address;

  Cliente({
    required this.name,
    required this.cpf,
    this.uid,
    required this.email,
    required this.phone,
    this.address,
  });
}
