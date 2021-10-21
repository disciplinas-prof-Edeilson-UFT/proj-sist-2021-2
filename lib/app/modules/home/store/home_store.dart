import 'package:mobx/mobx.dart';
import 'package:pscomidas/app/global/models/entities/restaurant.dart';
import 'package:pscomidas/app/global/models/enums/filter.dart';
import 'package:pscomidas/app/modules/home/components/restaurant_grid_firebase.dart';

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
    getRestaurants();
  }

  @observable
  var selectedCategory = '';

  @action
  void setSelectedCategory(String? selection) {
    selectedCategory = selection ?? '';
  }

  @observable
  List<Restaurant> restaurants = [];

  @action
  Future<List<Restaurant>> getRestaurants() async {
    final RestaurantGridFirestore restaurantGridFirestore =
        RestaurantGridFirestore();
    restaurants = await restaurantGridFirestore.getRestaurants();
    return restaurants;
  }
}
