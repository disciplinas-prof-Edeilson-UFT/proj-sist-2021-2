import 'package:pscomidas/app/global/models/entities/cliente.dart';

abstract class UpdateClientService {
  Future<bool> updateClient(Cliente client);
  Future<Cliente> getClientData();
}
