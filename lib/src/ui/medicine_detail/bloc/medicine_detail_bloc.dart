import 'dart:async';

import 'package:dro_health/src/app/app_barrel.dart';
import 'package:dro_health/src/app/locator/app_locator.dart';
import 'package:dro_health/src/data/data_barrel.dart';
import 'package:dro_health/src/models/models.dart';
import 'package:dro_health/src/utils/utils.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'medicine_detail_event.dart';

part 'medicine_detail_state.dart';

class MedicineDetailCubit extends Cubit<MedicineDetailState> {
  final MedicineRepositoryInterface repo;

  MedicineDetailCubit(
    Medicine medicine, {
    MedicineRepositoryInterface? repository,
  })  : repo = repository ?? locator<MedicineRepositoryInterface>(),
        super(MedicineDetailState(medicine));

  // {
  //   on<SimilarProductsFetched>(_fetchSimilarProducts);
  //   on<PacketQuantityChanged>(_changePacketQuantity);
  //   on<AddedToCart>(_addToCart);
  // }

  Future<void> fetchSimilarProducts() async {
    Medicine medicine = state.currentMedicine;

    try {
      List<Medicine> allMedicines = await repo.getAllMedicines();

      List<Medicine> similarMedicines =
          allMedicines.where((Medicine testMedicine) {
        return testMedicine.name.contains(medicine.name) ||
            testMedicine.seller.name == medicine.seller.name ||
            testMedicine.constituents == medicine.constituents;
      }).toList();

      emit(state.copyWith(
        similarProducts: similarMedicines,
        status: StateStatus.loaded,
      ));
    } catch (e) {
      emit(state.copyWith(status: StateStatus.error));
    }
  }

  FutureOr<void> addToCart() {
    emit(state.copyWith(
      addedToCart: true,
    ));
  }

  void changePacketQuantity(int packCount) {
    emit(state.copyWith(
      packQuantity: packCount,
    ));
  }
}
