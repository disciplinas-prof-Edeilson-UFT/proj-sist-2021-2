import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pscomidas/app/modules/auth/auth_repository.dart';
import 'package:mockito/mockito.dart';

class MockFirebaseAuth extends Mock implements FirebaseAuth {}

main() async {
  MockFirebaseAuth _auth = MockFirebaseAuth();
  final emailController = TextEditingController(text: 'grupo2@teste.com');
  final passwordController = TextEditingController(text: '12345678');

  final authRepository = AuthRepository(_auth);

  test('login', () async {
    expect(
      await authRepository.login(emailController.text, passwordController.text),
      'userCredential!.user!.uid',
    );
  });
}
