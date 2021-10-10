import 'package:pscomidas/app/modules/restaurant/dead_code/infra/models/result_search_model.dart';

abstract class SearchDataSource {
  Future<List<ResultSearchModel>> getSearch(String searchTitle);
}
