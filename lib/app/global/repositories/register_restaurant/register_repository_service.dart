import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

abstract class RegisterRepositoryService {
  Future<void>? addRestaurant(
      String restaurantUID, Map<String, TextEditingController> controller);
  Future<void>? addUser(
      String userUID, Map<String, TextEditingController> controller);
  Future<UserCredential>? signUp(Map<String, TextEditingController> controller);
  Future<bool>? isUniqueEmail(String email);
  Future<bool>? isUniqueCNPJ(String cnpj);
}
