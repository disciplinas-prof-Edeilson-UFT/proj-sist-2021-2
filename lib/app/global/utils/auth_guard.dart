import 'package:flutter_modular/flutter_modular.dart';
import 'package:pscomidas/app/global/utils/session.dart';
import 'package:pscomidas/app/modules/home/home_module.dart';

class ClientGuard extends RouteGuard {
  ClientGuard() : super(HomeModule.routeName);

  @override
  Future<bool> canActivate(String path, ModularRoute router) {
    return Modular.get<Session>().client;
  }
}
