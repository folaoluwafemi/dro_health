import 'dart:async';

import 'package:dro_health/src/app/app_barrel.dart';
import 'package:dro_health/src/models/cart/cart_item_model.dart';
import 'package:dro_health/src/utils/utils.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'cart_event.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  final UserBloc userBloc;

  CartCubit({required this.userBloc}) : super(CartState());

  // {
  //   on<CartFetched>(_fetchCart);
  //   on<CartItemCountChanged>(_changeCartItemCount);
  //   on<CartItemRemoved>(_removeCartItem);
  //   on<CheckedOut>(_addCartToUserAndCheckout);
  // }

  void fetchCart() {
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

  FutureOr<void> changeCartItemCount({
    required CartItem item,
    required int newCount,
  }) {
    CartItem tempItem = item.copyWith(quantity: newCount);

    List<CartItem> newCart = state.cartItems;

    int index = newCart.indexWhere((element) => element == item);
    newCart.removeAt(index);
    newCart.replaceRange(index, index, [tempItem]);

    emit(state.copyWith(cartItems: newCart));
  }

  FutureOr<void> removeCartItem(CartItem item) {
    List<CartItem> cart = state.cartItems;
    cart.remove(item);

    emit(state.copyWith(
      cartItems: cart,
    ));
  }

  FutureOr<void> addCartToUserAndCheckout() async {
    userBloc.add(UserCartChanged(state.cartItems));

    ///todo: checkout
  }
}
