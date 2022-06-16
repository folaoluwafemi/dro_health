import 'package:dro_health/src/models//models.dart';
import 'package:equatable/equatable.dart';

class CartItem extends Equatable {
  final Medicine medicine;
  final int quantity;

  const CartItem({
    required this.medicine,
    required this.quantity,
  });

  @override
  List<Object?> get props => [medicine, quantity];

  CartItem copyWith({
    Medicine? medicine,
    int? quantity,
  }) =>
      CartItem(
        medicine: medicine ?? this.medicine,
        quantity: quantity ?? this.quantity,
      );
}
