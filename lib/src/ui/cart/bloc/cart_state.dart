part of 'cart_bloc.dart';

class CartState extends Equatable {
  final StateStatus status;
  final List<CartItem> cartItems;
  double? _totalPrice;

  CartState({
    this.status = StateStatus.loading,
    this.cartItems = const [],
  }) {
    _totalPrice = _getCartTotalPrice(cartItems);
  }

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
  List<Object?> get props => [status, cartItems, totalPrice, _totalPrice];

// @override
// bool operator ==(Object other) {
//   return other is CartState &&
//       checkListEquality(cartItems, other.cartItems) &&
//       other.totalPrice == totalPrice;
// }
//
// @override
// int get hashCode => (totalPrice * cartItems.length).toInt();
}

double _getCartTotalPrice(List<CartItem> cartItems) {
  double price = 0;
  for (CartItem cartItem in cartItems) {
    price += (cartItem.medicine.price * cartItem.quantity);
  }
  return price;
}
