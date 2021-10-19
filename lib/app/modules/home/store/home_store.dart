import 'package:mobx/mobx.dart';
import 'package:pscomidas/app/global/models/enums/filter.dart';

part 'home_store.g.dart';

class HomeStore = HomeStoreBase with _$HomeStore;

abstract class HomeStoreBase with Store {
  @observable
  int counter = 0;

  Future<void> increment() async {
    counter = counter + 1;
  }

  @observable
  var selectedFilter = FilterType.avaliation;

  @action
  void setSelectedFilter(String? selection) {
    selectedFilter = FilterType.values.firstWhere(
      (e) => e.filterFrontEnd == selection,
      orElse: () => FilterType.avaliation,
    );
  }

  @observable
  var selectedCategory = 'Açaí';

  @action
  void setSelectedCategory(String? selection) {
    selectedCategory = selection ?? 'Açaí';
  }
}
