import 'package:dartz/dartz.dart';
import 'package:pscomidas/app/modules/restaurant/dead_code/domain/entities/result_search.dart';
import 'package:pscomidas/app/modules/restaurant/dead_code/domain/errors/errors.dart';
import 'package:pscomidas/app/modules/restaurant/dead_code/domain/repository/search_repository.dart';
import 'package:pscomidas/app/modules/restaurant/dead_code/infra/datasources/search_datasource.dart';

class SearchRepositoryImpl implements SearchRepository {
  final SearchDataSource dataSource;

  SearchRepositoryImpl(this.dataSource);

  @override
  Future<Either<SearchError, List<ResultSearch>>> search(
      String searchTitle) async {
    try {
      final result = await dataSource.getSearch(searchTitle);
      return Right(result);
    } catch (e) {
      return Left(DataSourceError());
    }
  }
}
