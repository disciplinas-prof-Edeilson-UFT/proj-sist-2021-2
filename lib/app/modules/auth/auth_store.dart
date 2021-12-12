import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:pscomidas/app/global/models/entities/delivery_at.dart';
import 'package:pscomidas/app/modules/auth/auth_repository.dart';

part 'auth_store.g.dart';

class AuthStore = _AuthStoreBase with _$AuthStore;

abstract class _AuthStoreBase with Store {
  final AuthRepository _authRepository;

  _AuthStoreBase(this._authRepository);

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @observable
  UserCredential? loggedUser;

  @observable
  DeliveryAt? currentAddress;

  @observable
  String errorMessage = '';

  @observable
  bool emailexiste = true;

  @observable
  bool logged = false;

  @observable
  bool _isClient = false;

  @computed
  Future<bool> get isClient async => !_isClient;

  @computed
  bool get client => _isClient;

  @observable
  bool emailVerified = true;

  @action
  Future<void> login() async {
    try {
      final response = await _authRepository.login(
        emailController.text,
        passwordController.text,
      );
      loggedUser = response['user'];
      _isClient = response['isClient'];
      if (_isClient) {
        currentAddress =
            await _authRepository.fetchDeliveryAt(response['delivery_at']);
      }
      if (!loggedUser!.user!.emailVerified) {
        emailVerified = false;
      } else {
        logged = true;
      }
    } on Exception catch (e) {
      if (e as String == 'user-not-found') {
        emailexiste = false;
      } else {
        errorMessage = e.toString();
      }
    }
  }

  @action
  Future<void> logFace() async {
    try {
      if (await _authRepository.signInWithFacebook() is UserCredential) {
        logged = true;
        _isClient = true;
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
    if (user.emailVerified == true) {
      emailVerified = true;
    }
  }

  @action
  Future<void> logGoogle() async {
    try {
      if (await _authRepository.signInWithGoogle() is UserCredential) {
        logged = true;
        _isClient = true;
      }
    } catch (e) {
      errorMessage = e.toString();
    }
  }

  @action
  void dispose() {
    logged = false;
    _isClient = false;
    errorMessage = '';
    emailController.clear();
    passwordController.clear();
  }
}
