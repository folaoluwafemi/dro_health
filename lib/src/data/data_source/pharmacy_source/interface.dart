import 'package:dro_health/src/models/models.dart';

abstract class PharmacySourceInterface {
  Future<Pharmacy> get();

  Future<void> post(Pharmacy pharmacy);
}


