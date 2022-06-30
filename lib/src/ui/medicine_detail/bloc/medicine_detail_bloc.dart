import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dro_health/src/app/locator/app_locator.dart';
import 'package:dro_health/src/data/data.dart';
import 'package:dro_health/src/models/models.dart';
import 'package:equatable/equatable.dart';

part 'medicine_detail_event.dart';

part 'medicine_detail_state.dart';

class MedicineDetailBloc
    extends Bloc<MedicineDetailEvent, MedicineDetailState> {
  final MedicineRepositoryInterface repo;

  MedicineDetailBloc(
    Medicine medicine, {
    MedicineRepositoryInterface? repository,
  })  : repo = repository ?? locator<MedicineRepositoryInterface>(),
        super(MedicineDetailState(medicine)) {
    on<SimilarProductsFetched>(_fetchSimilarProducts);
    on<PacketQuantityChanged>(_changePacketQuantity);
    on<AddedToCart>(_addToCart);
  }

  Future<void> _fetchSimilarProducts(
    SimilarProductsFetched event,
    Emitter<MedicineDetailState> emit,
  ) async {
    Medicine medicine = state.currentMedicine;
    List<Medicine> allMedicines = await repo.getAllMedicines();
    List<Medicine> similarMedicines =
        allMedicines.where((Medicine testMedicine) {
      return testMedicine.name.contains(medicine.name) ||
          testMedicine.seller.name == medicine.seller.name ||
          testMedicine.constituents == medicine.constituents;
    }).toList();

    emit(state.copyWith(
      similarProducts: similarMedicines,
      status: MedicineDetailStateStatus.loaded,
    ));
  }

  FutureOr<void> _addToCart(
    AddedToCart event,
    Emitter<MedicineDetailState> emit,
  ) {
    ///todo: add to cart
  }

  void _changePacketQuantity(
    PacketQuantityChanged event,
    Emitter<MedicineDetailState> emit,
  ) {
    emit(state.copyWith(
      packQuantity: event.packCount,
    ));
  }
}
