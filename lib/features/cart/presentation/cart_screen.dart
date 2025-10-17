import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/cart_cubit.dart';
import '../cubit/cart_state.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CartCubit(),
      child: Scaffold(
        appBar: AppBar(title: const Text('Shopping Cart')),
        body: BlocBuilder<CartCubit, CartState>(
          builder: (context, state) {
            return Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: state.items.length,
                    itemBuilder: (context, index) {
                      final item = state.items[index];
                      return ListTile(
                        title: Text(item.name),
                        subtitle: Text('Qty: ${item.quantity}'),
                        trailing: Text(
                          '\$${(item.price * item.quantity).toStringAsFixed(2)}',
                        ),
                      );
                    },
                  ),
                ),
                Text('Discount: \$${state.discount.toStringAsFixed(2)}'),
                Text(
                  'Total: \$${(state.total - state.discount).toStringAsFixed(2)}',
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
