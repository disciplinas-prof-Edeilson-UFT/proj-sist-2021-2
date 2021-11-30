import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

abstract class IRegisterRepository {
  Future<DocumentReference>? addRestaurant();
  Future<void>? addUser(String userUID, String restaurantUID);
  Future<UserCredential>? signUp();
}
