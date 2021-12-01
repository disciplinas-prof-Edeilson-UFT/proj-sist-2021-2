import 'package:firebase_auth/firebase_auth.dart';

abstract class IRegisterRepository {
  Future<void>? addRestaurant(String restaurantUID);
  Future<void>? addUser(String userUID);
  Future<UserCredential>? signUp();
  Future<bool>? isUniqueEmail(String email);
  Future<bool>? isUniqueCNPJ(String cnpj);
}
