import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_test_laporty/features/cart/cubit/cart_cubit.dart';
import 'package:flutter_test_laporty/features/cart/data/models/cart_item.dart';

void main() {
  group('CartCubit', () {
    late CartCubit cubit;

    setUp(() {
      cubit = CartCubit();
    });

    test('Add item increases items list', () {
      final item = CartItem(id: '1', name: 'Apple', price: 2.0);
      cubit.addItem(item);

      expect(cubit.state.items.length, 1);
      expect(cubit.state.total, 2.0);
    });

    test('Add duplicate item updates quantity', () {
      final item = CartItem(id: '1', name: 'Apple', price: 2.0);
      cubit.addItem(item);
      cubit.addItem(item);

      expect(cubit.state.items.length, 1);
      expect(cubit.state.items[0].quantity, 2);
    });

    test('Remove item decreases items list', () {
      final item = CartItem(id: '1', name: 'Apple', price: 2.0);
      cubit.addItem(item);
      cubit.removeItem('1');

      expect(cubit.state.items.isEmpty, true);
      expect(cubit.state.total, 0);
    });
  });
}
