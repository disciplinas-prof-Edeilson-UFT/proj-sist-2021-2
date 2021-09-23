import 'package:flutter_test/flutter_test.dart';
import 'package:pscomidas/app/modules/restaurant_home/restaurantHome_store.dart';
 
void main() {
  late RestaurantHomeStore store;

  setUpAll(() {
    store = RestaurantHomeStore();
  });

  test('increment count', () async {
    expect(store.value, equals(0));
    store.increment();
    expect(store.value, equals(1));
  });
}