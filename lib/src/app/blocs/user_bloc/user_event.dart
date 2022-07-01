part of 'user_bloc.dart';

abstract class UserEvent extends Equatable {
  const UserEvent();
}

class UserFetched extends UserEvent {
  @override
  List<Object?> get props => [];
}

class UserCartItemAdded extends UserEvent {
  final CartItem cartItem;

  const UserCartItemAdded(this.cartItem);

  @override
  List<Object?> get props => [cartItem];
}

class UserCartItemRemoved extends UserEvent {
  final CartItem cartItem;

  const UserCartItemRemoved(this.cartItem);

  @override
  List<Object?> get props => [cartItem];
}

class UserCartChanged extends UserEvent {
  final List<CartItem> cart;

  const UserCartChanged(this.cart);

  @override
  List<Object?> get props => [cart];
}
