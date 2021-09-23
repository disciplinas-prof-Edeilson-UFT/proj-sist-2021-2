import 'package:flutter_test/flutter_test.dart';
import 'package:pscomidas/app/modules/restaurant/restaurant_store.dart';
 
void main() {
  late RestaurantStore store;

  setUpAll(() {
    store = RestaurantStore();
  });

  test('increment count', () async {
    expect(store.value, equals(0));
    store.increment();
    expect(store.value, equals(1));
  });
}