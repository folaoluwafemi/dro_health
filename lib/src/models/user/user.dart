import 'package:dro_health/src/models/models.dart';
import 'package:equatable/equatable.dart';

class User extends Equatable {
  final String? name;
  final String? email;
  final List<String> favorites;
  final List<CartItem> _cart;

  const User({
    required this.favorites,
    List<CartItem>? cart,
    this.name,
    this.email,
  }) : _cart = cart ?? const [];

  List<CartItem> get cart => _cart;

  User copyWith({
    String? name,
    String? email,
    List<String>? favorites,
    List<CartItem>? cart,
  }) =>
      User(
        favorites: favorites ?? this.favorites,
        name: name ?? this.name,
        email: email ?? this.email,
        cart: cart ?? _cart,
      );

  @override
  List<Object?> get props => [name, email, _cart, favorites];
}
