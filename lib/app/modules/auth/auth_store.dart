import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:pscomidas/app/modules/auth/auth_repository.dart';

part 'auth_store.g.dart';

class AuthStore = _AuthStoreBase with _$AuthStore;

abstract class _AuthStoreBase with Store {
  final AuthRepository _authRepository;

  _AuthStoreBase(this._authRepository);

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @observable
  String errorMessage = '';

  @observable
  bool logged = false;

  @observable
  bool emailVerified = true;

  @action
  Future<void> login() async {
    errorMessage = '';
    try {
      if (await _authRepository.login(
        emailController.text,
        passwordController.text,
      ) is UserCredential) {
        logged = true;
      } else {
        emailVerified = false;
      }
    } catch (e) {
      errorMessage = e.toString();
    }
  }

  @action
  Future<void> logFace() async {
    try {
      if (await _authRepository.signInWithFacebook() is UserCredential) {
        logged = true;
      }
    } catch (e) {
      errorMessage = e.toString();
    }
  }

  @action
  Future<void> checkEmailVerified() async {
    User user;
    user = FirebaseAuth.instance.currentUser!;
    await user.reload();
    if (!user.emailVerified) {
      user.sendEmailVerification();
      emailVerified = false;
    }
  }

  @action
  Future<void> logGoogle() async {
    try {
      if (await _authRepository.signInWithGoogle() is UserCredential) {
        logged = true;
      }
    } catch (e) {
      errorMessage = e.toString();
    }
  }

  @action
  void dispose() {
    logged = false;
    errorMessage = '';
    emailController.clear();
    passwordController.clear();
  }
}
