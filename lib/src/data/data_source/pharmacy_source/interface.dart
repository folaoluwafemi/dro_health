import 'package:dro_health/src/models/models.dart';
import 'package:http/http.dart';

abstract class PharmacySourceInterface {
  final Client client;

  PharmacySourceInterface(this.client);

  Future<Pharmacy> getPharmacy();
}
