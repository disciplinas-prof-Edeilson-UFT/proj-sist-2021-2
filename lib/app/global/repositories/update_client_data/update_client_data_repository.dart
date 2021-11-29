import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:pscomidas/app/global/models/entities/cliente.dart';

import 'update_client_data_service.dart';

final userCollection = FirebaseFirestore.instance.collection('users');
final clientsCollection = FirebaseFirestore.instance.collection('clients');
final currentUser = FirebaseAuth.instance.currentUser;
final String uid = currentUser!.uid;

class UpdateClientRepository extends UpdateClientService {
  @override
  Future<bool> updateClient(Cliente client) async {
    try {
      await userCollection.doc(uid).set(
        {
          'name': client.name,
          'email': client.email,
          'phone': client.phone,
        },
      );
      await clientsCollection.doc(uid).set({
        'cpf': client.cpf,
      });
      currentUser!.updateEmail(client.email);
      return true;
    } catch (e) {
      throw Exception('Não foi possível atualizar os dados do cliente.');
    }
  }

  @override
  Future<Cliente> getClientData() async {
    late Cliente clientData;
    try {
      var clientCpf = await clientsCollection.doc(uid).get();
      await userCollection.doc(uid).get().then(
            (value) => clientData = Cliente(
              name: value['name'],
              cpf: clientCpf['cpf'],
              email: value['email'],
              phone: value['phone'],
              uid: uid,
            ),
          );
      return clientData;
    } catch (e) {
      throw Exception('Não foi possível obter os dados do cliente.');
    }
  }
}
