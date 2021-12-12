import 'package:firebase_auth/firebase_auth.dart';
import 'package:pscomidas/app/global/models/entities/delivery_at.dart';

abstract class AuthService {
  Future<Map<String, dynamic>> login(String email, String password);

  Future<DeliveryAt> fetchDeliveryAt(String uid);

  Future<UserCredential> signInWithGoogle();

  Future<UserCredential> signInWithFacebook();
}
