import 'package:firebase_auth/firebase_auth.dart';

abstract class IRegisterRepository {
  Future<void>? addRestaurant();
  Future<UserCredential>? signUp();
}
