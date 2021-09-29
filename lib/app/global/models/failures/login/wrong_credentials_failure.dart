import 'package:pscomidas/app/global/models/failures/common/failure.dart';

class WrongCredentialsFailure implements Failure {
  @override
  String get message => 'E-mail ou Senha incorretos.';
}
