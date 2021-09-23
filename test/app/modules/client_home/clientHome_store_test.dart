import 'package:flutter_test/flutter_test.dart';
import 'package:pscomidas/app/modules/client_home/clientHome_store.dart';
 
void main() {
  late ClientHomeStore store;

  setUpAll(() {
    store = ClientHomeStore();
  });

  test('increment count', () async {
    expect(store.value, equals(0));
    store.increment();
    expect(store.value, equals(1));
  });
}