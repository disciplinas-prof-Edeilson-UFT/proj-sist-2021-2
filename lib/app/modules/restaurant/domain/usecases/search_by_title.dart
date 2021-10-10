import 'package:dartz/dartz.dart';
import 'package:pscomidas/app/modules/restaurant/domain/entities/result_search.dart';
import 'package:pscomidas/app/modules/restaurant/domain/errors/errors.dart';
import 'package:pscomidas/app/modules/restaurant/domain/repository/search_repository.dart';

abstract class SearchByTitle {
  Future<Either<SearchError, List<ResultSearch>>> call(String searchTitle);
}

class SearchByTitleImpl implements SearchByTitle {
  final SearchRepository repository;

  SearchByTitleImpl(this.repository);

  @override
  Future<Either<SearchError, List<ResultSearch>>> call(
      String searchTitle) async {
    return repository.search(searchTitle);
  }
}
