import 'dart:async';

import 'package:dro_health/src/app/app_barrel.dart';
import 'package:dro_health/src/models/cart/cart_item_model.dart';
import 'package:dro_health/src/utils/utils.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'cart_event.dart';

part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  final UserBloc userBloc;

  CartBloc({required this.userBloc}) : super(CartState()) {
    on<CartFetched>(_fetchCart);
    on<CartItemCountChanged>(_changeCartItemCount);
    on<CartItemRemoved>(_removeCartItem);
    on<CheckedOut>(_addCartToUserAndCheckout);
  }

  void _fetchCart(
    CartFetched event,
    Emitter<CartState> emit,
  ) {
    try {
      if (userBloc.state.user == null) {
        userBloc.add(UserFetched());
      }
      List<CartItem> cart = userBloc.state.user!.cart;

      emit(state.copyWith(
        status: StateStatus.loaded,
        cartItems: cart,
      ));
    } catch (e) {
      emit(state.copyWith(
        status: StateStatus.error,
      ));
    }
  }

  FutureOr<void> _changeCartItemCount(
    CartItemCountChanged event,
    Emitter<CartState> emit,
  ) {
    CartItem item = event.item.copyWith(quantity: event.newCount);

    List<CartItem> newCart = state.cartItems;

    int index = newCart.indexWhere((element) => element == event.item);
    newCart.removeAt(index);
    newCart.replaceRange(index, index, [item]);

    emit(state.copyWith(cartItems: newCart));
  }

  FutureOr<void> _removeCartItem(
    CartItemRemoved event,
    Emitter<CartState> emit,
  ) {
    List<CartItem> cart = state.cartItems;
    cart.remove(event.item);

    emit(state.copyWith(
      cartItems: cart,
    ));
  }

  FutureOr<void> _addCartToUserAndCheckout(
    CheckedOut event,
    Emitter<CartState> emit,
  ) async {
    userBloc.add(UserCartChanged(state.cartItems));

    ///todo: checkout
  }
}
