import 'package:dartz/dartz.dart';
import 'package:pscomidas/app/modules/restaurant/domain/entities/result_search.dart';
import 'package:pscomidas/app/modules/restaurant/domain/errors/errors.dart';

abstract class SearchRepository {
  Future<Either<SearchError, List<ResultSearch>>> search(String searchTitle);
}
