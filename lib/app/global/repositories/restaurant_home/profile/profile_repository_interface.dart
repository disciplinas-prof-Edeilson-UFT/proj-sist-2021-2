import 'package:pscomidas/app/global/models/entities/restaurant.dart';

abstract class IProfile {
  Future<Restaurant> getRestaurant();
  Future setImage(dynamic e);
}