import 'package:flutter_bloc/flutter_bloc.dart';

import '../data/models/cart_item.dart';
import 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartState.initial());

  void addItem(CartItem item) {
    final items = List<CartItem>.from(state.items);
    final index = items.indexWhere((i) => i.id == item.id);

    if (index >= 0) {
      // تحديث الكمية إذا العنصر موجود
      items[index].quantity += item.quantity;
    } else {
      items.add(item);
    }

    emit(state.copyWith(items: items));
    _updateTotals(items);
  }

  void removeItem(String id) {
    final items = List<CartItem>.from(state.items)
      ..removeWhere((i) => i.id == id);
    emit(state.copyWith(items: items));
    _updateTotals(items);
  }

  void _updateTotals(List<CartItem> items) {
    double total = items.fold(0, (sum, i) => sum + i.price * i.quantity);
    double discount = _calculateDiscount(items);
    emit(state.copyWith(total: total, discount: discount));
  }

  double _calculateDiscount(List<CartItem> items) {
    // مثال: خصم 10% إذا عدد العناصر > 5
    final totalQty = items.fold(0, (sum, i) => sum + i.quantity);
    return totalQty > 5
        ? 0.1 * items.fold(0, (sum, i) => sum + i.price * i.quantity)
        : 0;
  }
}
