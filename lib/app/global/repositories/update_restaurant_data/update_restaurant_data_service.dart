import 'package:pscomidas/app/global/models/entities/restaurant.dart';

abstract class UpdateRestaurantDataService {
  Future<Restaurant> getRestaurant();
  Future<void> setProfileRestaurant(Restaurant restaurant);
  Future<void> setManagementRestaurant(Restaurant restaurant);
  Future<void> setAdressRestaurant(Restaurant restaurant);
  Future<void> setImage(dynamic e);
}
