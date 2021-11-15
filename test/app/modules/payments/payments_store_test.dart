import 'package:flutter_test/flutter_test.dart';
import 'package:pscomidas/app/modules/payments/payments_store.dart';
 
void main() {
  late PaymentsStore store;

  setUpAll(() {
    store = PaymentsStore();
  });

  test('increment count', () async {
    expect(store.value, equals(0));
    store.increment();
    expect(store.value, equals(1));
  });
}