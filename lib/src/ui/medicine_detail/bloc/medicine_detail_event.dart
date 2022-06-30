part of 'medicine_detail_bloc.dart';

abstract class MedicineDetailEvent extends Equatable {
  const MedicineDetailEvent();
}

class SimilarProductsFetched extends MedicineDetailEvent {
  @override
  List<Object?> get props => [];
}

class PacketQuantityChanged extends MedicineDetailEvent {
  final int packCount;

  const PacketQuantityChanged(this.packCount);

  @override
  List<Object?> get props => [packCount];
}

class AddedToCart extends MedicineDetailEvent {
  @override
  List<Object?> get props => [];
}
