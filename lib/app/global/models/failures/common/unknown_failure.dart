import 'package:pscomidas/app/global/models/failures/common/failure.dart';

class UnknownFailure implements Failure {
  @override
  String get message => 'Ocorreu um erro desconhecido.';
}
