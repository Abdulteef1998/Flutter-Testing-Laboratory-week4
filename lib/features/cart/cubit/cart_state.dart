import '../data/models/cart_item.dart';

class CartState {
  final List<CartItem> items;
  final double total;
  final double discount;

  CartState({required this.items, required this.total, required this.discount});

  factory CartState.initial() => CartState(items: [], total: 0, discount: 0);

  CartState copyWith({List<CartItem>? items, double? total, double? discount}) {
    return CartState(
      items: items ?? this.items,
      total: total ?? this.total,
      discount: discount ?? this.discount,
    );
  }
}
