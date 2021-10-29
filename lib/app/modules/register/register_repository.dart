import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:pscomidas/app/global/models/entities/user.dart';

class RegisterRepository {
  final FirebaseAuth auth;
  RegisterRepository(this.auth);
  final userCollection = FirebaseFirestore.instance.collection('users');
  final clientsCollection = FirebaseFirestore.instance.collection('clients');
  final addressCollection = FirebaseFirestore.instance.collection('address');

  Future<UserCredential> registerClient(Cliente user, String password) async {
    try {
      UserCredential userCredential = await auth.createUserWithEmailAndPassword(
        email: user.email,
        password: password,
      );
      await userCollection.add({
        'name': user.name,
        'email': user.email,
      }).then(
        (value) async => await clientsCollection.add({
          'cards': null,
          'cpf': user.cpf,
        }).then(
          (value) async => await addressCollection.add({}),
        ),
      );
      return userCredential;
    } catch (e) {
      throw Exception('Houve um erro ao registrar');
    }
  }
}
