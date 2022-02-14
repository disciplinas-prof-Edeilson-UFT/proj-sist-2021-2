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
  String? errorMessage;

  @observable
  bool emailexiste = true;

  @observable
  bool logged = false;

  @observable
  bool _isClient = false;

  @computed
  bool get client => _isClient;

  @observable
  bool emailVerified = true;

  @action
  login() async {
    try {
      final response = await _authRepository.login(
        emailController.text,
        passwordController.text,
      );
      await setUserInfo(response);
    } catch (e) {
      if (e.toString() == 'Exception: Usuário não encontrado') {
        emailexiste = false;
      } else {
        errorMessage = e.toString();
      }
    }
  }

  @action
  logFace() async {
    try {
      final response = await _authRepository.signInWithFacebook();
      await setUserInfo(response);
    } catch (e) {
      errorMessage = e.toString();
    }
  }

  @action
  checkEmailVerified() async {
    User user;
    user = FirebaseAuth.instance.currentUser!;
    await user.reload();
    if (user.emailVerified) {
      emailVerified = true;
    }
  }

  @action
  setUserInfo(Map<String, dynamic> userInfo) async {
    loggedUser = userInfo['user'];
    _isClient = userInfo['isClient'];
    if (_isClient) {
      currentAddress =
          await _authRepository.fetchDeliveryAt(userInfo['delivery_at']);
    }
    if (!loggedUser!.user!.emailVerified) {
      emailVerified = false;
    } else {
      logged = true;
    }
  }

  @action
  logGoogle() async {
    try {
      final response = await _authRepository.signInWithGoogle();
      await setUserInfo(response);
    } catch (e) {
      errorMessage = e.toString();
    }
  }

  @action
  void dispose() {
    logged = false;
    _isClient = false;
    errorMessage = null;
    emailController.clear();
    passwordController.clear();
  }
}
