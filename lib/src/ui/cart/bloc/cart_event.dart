part of 'cart_bloc.dart';

abstract class CartEvent extends Equatable {
  const CartEvent();
}

class CartFetched extends CartEvent {
  @override
  List<Object?> get props => [];
}

class CartItemCountChanged extends CartEvent {
  final CartItem item;
  final int newCount;

  const CartItemCountChanged({
    required this.item,
    required this.newCount,
  });

  @override
  List<Object?> get props => [item, newCount];
}

class CartItemRemoved extends CartEvent {
  final CartItem item;

  const CartItemRemoved(this.item);

  @override
  List<Object?> get props => [item];
}

class CheckedOut extends CartEvent {
  @override
  List<Object?> get props => [];
}
