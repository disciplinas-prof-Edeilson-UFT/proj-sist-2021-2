import 'package:shared_preferences/shared_preferences.dart';

class Session {
  bool isClient;
  bool isLogged;
  String street;

  Session({
    this.isClient = false,
    this.isLogged = false,
    this.street = '',
  });

  saveClient(String address, bool isc) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isClient', isClient);
    await prefs.setBool('isLogged', true);
    await prefs.setString('street', street);
    isClient = isc;
    isLogged = true;
    street = address;
  }

  Future<bool> get client async => !isClient;
}
