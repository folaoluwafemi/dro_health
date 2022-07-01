import 'dart:async';

import 'package:dro_health/src/data/data_barrel.dart';
import 'package:dro_health/src/models/models.dart';

class MedicineRepository implements MedicineRepositoryInterface {
  final PharmacySourceInterface dataSource;

  MedicineRepository(this.dataSource);

  @override
  Future<List<Medicine>> getAllMedicines() async {
    Pharmacy pharmacy = await dataSource.getPharmacy();

    ///Set to prevent duplicate medicines
    Set<Medicine> medicines = {};

    for (Category category in pharmacy.categories) {
      medicines.addAll(category.medicines);
    }
    return medicines.toList();
  }

  @override
  FutureOr<List<Medicine>> searchMedicines({
    required String query,
    List<Medicine>? medicines,
  }) async {
    List<Medicine> meds = medicines ?? await getAllMedicines();

    List<Medicine> searchResult = meds.where((medicine) {
      return (medicine.name.contains(query));
    }).toList();

    return searchResult;
  }
}
