import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pscomidas/app/modules/restaurant/dead_code/infra/datasources/search_datasource.dart';
import 'package:pscomidas/app/modules/restaurant/dead_code/infra/models/result_search_model.dart';

class FirebaseDataSource implements SearchDataSource {
  @override
  Future<List<ResultSearchModel>> getSearch(String searchTitle) async {
    var querySnapshot = await FirebaseFirestore.instance
        .collection('products')
        .where('name', isGreaterThanOrEqualTo: searchTitle)
        .get();

    return querySnapshot.docs
        .map((doc) => ResultSearchModel.fromMap(doc.data()))
        .toList();
  }
}
