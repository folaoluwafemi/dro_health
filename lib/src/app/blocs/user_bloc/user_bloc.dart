import 'dart:async';

import 'package:dro_health/src/app/app_barrel.dart';
import 'package:dro_health/src/app/locator/app_locator.dart';
import 'package:dro_health/src/data/data_barrel.dart';
import 'package:dro_health/src/models/models.dart';
import 'package:dro_health/src/utils/enums/status.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'user_event.dart';

part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final UserRepositoryInterface repo;

  UserBloc({UserRepositoryInterface? repository})
      : repo = repository ?? locator<UserRepositoryInterface>(),
        super(const UserState()) {
    on<UserFetched>(_fetchUser);
    on<UserCartItemRemoved>(_removeCartItem);
    on<UserCartItemAdded>(_addCartItem);
    on<UserCartChanged>(_changeUserCart);
  }

  FutureOr<void> _fetchUser(
    UserFetched event,
    Emitter<UserState> emit,
  ) async {
    User user = await repo.getUser();
    emit(state.copyWith(
      user: user,
      status: StateStatus.loaded,
    ));
  }

  void _removeCartItem(
    UserCartItemRemoved event,
    Emitter<UserState> emit,
  ) {
    List<CartItem> newCart = state.user?.cart ?? [];

    newCart.remove(event.cartItem);
    emit(
      state.copyWith(
        user: state.user?.copyWith(cart: newCart),
      ),
    );
  }

  void _addCartItem(
    UserCartItemAdded event,
    Emitter<UserState> emit,
  ) {
    List<CartItem> newCart = state.user?.cart ?? [];

    newCart.add(event.cartItem);
    emit(
      state.copyWith(
        user: state.user?.copyWith(cart: newCart),
      ),
    );
  }

  void _changeUserCart(
    UserCartChanged event,
    Emitter<UserState> emit,
  ) {
    emit(state.copyWith(
        user: state.user?.copyWith(
      cart: event.cart,
    )));
  }
}
