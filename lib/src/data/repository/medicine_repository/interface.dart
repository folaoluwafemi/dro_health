import 'dart:async';

import 'package:dro_health/src/models/medicine/medicine_model.dart';

abstract class MedicineRepositoryInterface {
  Future<List<Medicine>> getAllMedicines();

  FutureOr<List<Medicine>> searchMedicines({
    required String query,
    List<Medicine>? medicines,
  });
}
