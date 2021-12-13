import 'package:pscomidas/app/global/models/enums/address_type.dart';

class DeliveryAt {
  final bool? active;
  final String? street;
  final String? block;
  final String? complement;
  late String? number;
  final String cep;
  final String city;
  final String uf;
  late String? id;
  late FilterAddressType? addressType;

  DeliveryAt({
    this.active = false,
    this.street,
    this.block,
    this.complement,
    this.number,
    required this.cep,
    this.city = 'Palmas',
    this.uf = 'TO',
    this.id,
    this.addressType,
  });

  Map<String, dynamic> toMap() {
    return {
      'active': active,
      'cep': cep,
      'city': city,
      'complement': complement,
      'district': block,
      'number': number,
      'street': street,
      'uf': uf,
      'addressType': FilterAddressType.casa.label.toLowerCase(),
    };
  }

  static DeliveryAt fromMap({required Map<String, dynamic> map, String? uid}) {
    return DeliveryAt(
        id: uid,
        active: map['active'],
        cep: map['cep'],
        city: map['city'],
        complement: map['complement'],
        block: map['district'],
        number: map['number'],
        street: map['street'],
        uf: map['uf'],
        addressType:
            FilterAddressType.values.first.stringTotype(map['address_type']));
  }
}
