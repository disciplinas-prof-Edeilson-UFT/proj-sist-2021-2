import 'package:dartz/dartz.dart';
import 'package:pscomidas/app/modules/restaurant/dead_code/domain/entities/result_search.dart';
import 'package:pscomidas/app/modules/restaurant/dead_code/domain/errors/errors.dart';

abstract class SearchRepository {
  Future<Either<SearchError, List<ResultSearch>>> search(String searchTitle);
}
