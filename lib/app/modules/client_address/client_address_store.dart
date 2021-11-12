import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

part 'client_address_store.g.dart';

class ClientAddressStore = _ClientAddressStoreBase with _$ClientAddressStore;

abstract class _ClientAddressStoreBase with Store {
  final pageController = PageController(initialPage: 0);
  final textController = TextEditingController();

  void jump(int page) {
    pageController.jumpToPage(page);
  }

  void next() {
    pageController.nextPage(
      duration: const Duration(milliseconds: 500),
      curve: Curves.ease,
    );
  }

  void previous() {
    pageController.previousPage(
      duration: const Duration(milliseconds: 500),
      curve: Curves.ease,
    );
  }
}
