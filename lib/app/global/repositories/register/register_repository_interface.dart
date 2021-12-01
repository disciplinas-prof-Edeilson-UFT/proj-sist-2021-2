import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

abstract class IRegisterRepository {
  Future<void>? addRestaurant(String restaurantUID);
  Future<void>? addUser(String userUID);
  Future<UserCredential>? signUp();
}
