import 'package:pscomidas/app/global/models/entities/restaurant.dart';

abstract class IProfile {
  Future<Restaurant> getRestaurant();
  Future<void> setRestaurant(Restaurant restaurant);
  Future<void> setImage(dynamic e);
}
