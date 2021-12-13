import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:pscomidas/app/global/models/entities/delivery_at.dart';
import 'package:pscomidas/app/global/models/enums/address_type.dart';
import 'package:search_cep/search_cep.dart';

final clientCollection = FirebaseFirestore.instance.collection('clients');
final addressCollection = FirebaseFirestore.instance.collection('address');
final currentUser = FirebaseAuth.instance.currentUser;

class ClientAddressRepository {
  Future<DeliveryAt> findCEP(String cep, String? id) async {
    try {
      final viaCep = ViaCepSearchCep();
      final infoCepJson =
          await viaCep.searchInfoByCep(cep: cep.replaceAll('-', ''));
      return infoCepJson.fold(
        (l) => throw l,
        (r) => DeliveryAt(
          street: r.logradouro!,
          block: r.bairro!,
          complement: r.complemento!,
          number: null,
          cep: cep,
          city: r.localidade!,
          uf: r.uf!,
          id: id,
          addressType: FilterAddressType.values.first.stringTotype(null),
        ),
      );
    } catch (e) {
      throw e.toString();
    }
  }

  Future<List<DeliveryAt>> fetchAddresses() async {
    late List address;
    List<DeliveryAt> addresses = [];
    try {
      await clientCollection
          .doc(currentUser!.uid)
          .get()
          .then((doc) => address = doc.data()!['address']);
      for (var element in address) {
        await addressCollection.doc(element).get().then(
              (value) => addresses.add(
                DeliveryAt.fromMap(
                  map: value.data()!,
                  uid: element,
                ),
              ),
            );
      }
      return addresses;
    } catch (e) {
      throw Exception('Não foi possível recolher os dados de endereço');
    }
  }

  Future<void> updateDeliveryAt(String id) async {
    try {
      await clientCollection.doc(currentUser!.uid).update({'delivery_at': id});
    } catch (e) {
      throw Exception('Não foi possível atualizar o endereço atual');
    }
  }

  Future<void> updateAddress(DeliveryAt address) async {
    try {
      await addressCollection.doc(address.id).update({
        'active': address.active,
        'cep': address.cep,
        'city': address.city,
        'complement': address.complement,
        'district': address.block,
        'number': address.number,
        'street': address.street,
        'uf': address.uf,
      }).then((value) => log('atualizamo'));
    } catch (e) {
      throw Exception('Não foi possível atualizar os dados do endereço');
    }
  }

  Future<void> updateCurrentAddress(String uid) async {
    try {
      await clientCollection.doc(currentUser!.uid).update({'delivery_at': uid});
    } catch (e) {
      rethrow;
    }
  }

  Future<void> createAddress(DeliveryAt address) async {
    try {
      await addressCollection.add({
        'active': address.active,
        'cep': address.cep,
        'city': address.city,
        'complement': address.complement,
        'district': address.block,
        'number': address.number,
        'street': address.street,
        'uf': address.uf,
        'address_type': address.addressType!.label.toLowerCase(),
      }).then((value) async {
        await clientCollection.doc(currentUser!.uid).update(
          {
            'address': FieldValue.arrayUnion([value.id]),
            'delivery_at': value.id,
          },
        );
      });
    } catch (e) {
      throw Exception('Não foi possível criar um novo endereço');
    }
  }

  Future<void> removeAddress(String uid, List<String> clientAddresses) async {
    try {
      await clientCollection
          .doc(currentUser!.uid)
          .update({'address': clientAddresses})
          .then((value) => log('Endereço atualizado na tabela clients'))
          .onError((error, stackTrace) => throw stackTrace);

      await addressCollection.doc(uid).delete().then(
          (value) => log('O endereço do usuário foi deletado com sucesso'));
    } catch (e) {
      throw Exception(
          'Não foi possível remover os dados de endereço do usuário');
    }
  }
}
