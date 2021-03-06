part of 'medicine_detail_bloc.dart';


class MedicineDetailState extends Equatable {
  final List<Medicine> similarProducts;
  final Medicine currentMedicine;
  final StateStatus status;
  final bool addedToCart;
  final int packQuantity;

  const MedicineDetailState(
    this.currentMedicine, {
    this.similarProducts = const [],
    this.status = StateStatus.loading,
    this.packQuantity = 0,
    this.addedToCart = false,
  });

  @override
  List<Object?> get props => [
        similarProducts,
        currentMedicine,
        status,
        addedToCart,
        packQuantity,
      ];

  MedicineDetailState copyWith({
    List<Medicine>? similarProducts,
    Medicine? currentMedicine,
    StateStatus? status,
    bool? addedToCart,
    int? packQuantity,
  }) =>
      MedicineDetailState(
        currentMedicine ?? this.currentMedicine,
        similarProducts: similarProducts ?? this.similarProducts,
        status: status ?? this.status,
        addedToCart: addedToCart ?? this.addedToCart,
        packQuantity: packQuantity ?? this.packQuantity,
      );
}
