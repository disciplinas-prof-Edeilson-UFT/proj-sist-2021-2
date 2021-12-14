import 'package:firebase_auth/firebase_auth.dart';
import 'package:pscomidas/app/global/models/entities/delivery_at.dart';

abstract class AuthService {
  Future<Map<String, dynamic>> login(String email, String password);

  Future<DeliveryAt> fetchDeliveryAt(String uid);

  Future<Map<String, dynamic>> signInWithGoogle();

  Future<Map<String, dynamic>> getUserInfo(UserCredential user);

  Future<Map<String, dynamic>> signInWithFacebook();
}
