part of 'cart_bloc.dart';

class CartState extends Equatable {
  final StateStatus status;
  final List<CartItem> cartItems;

  const CartState({
    this.status = StateStatus.loading,
    this.cartItems = const [],
  });

  double get totalPrice => _getCartTotalPrice(cartItems);

  CartState copyWith({
    StateStatus? status,
    List<CartItem>? cartItems,
  }) =>
      CartState(
        status: status ?? this.status,
        cartItems: cartItems ?? this.cartItems,
      );

  @override
  List<Object?> get props => [status, cartItems];
}

double _getCartTotalPrice(List<CartItem> cartItems) {
  double price = 0;
  for (CartItem cartItem in cartItems) {
    price += cartItem.medicine.price;
  }
  return price;
}
