import 'dart:convert';
import 'dart:developer' as dev;

import 'package:dro_health/src/data/data_source/pharmacy_source/interface.dart';
import 'package:dro_health/src/models/pharmacy/pharmacy.dart';
import 'package:dro_health/src/models/pharmacy/pharmacy_factory.dart';
import 'package:dro_health/src/utils/constants/constants.dart';
import 'package:dro_health/src/utils/error/failure.dart';
import 'package:http/http.dart';

class PharmacySource implements PharmacySourceInterface {
  @override
  final Client client;

  PharmacySource(this.client);

  @override
  Future<Pharmacy> getPharmacy() async {
    Map<String, dynamic> rawData = await _tryRequest();
    return PharmacyFactory.fromMap(rawData);
  }

  Future<Map<String, dynamic>> _tryRequest() async {
    try {
      return _makeRequest();
    } catch (e) {
      dev.log('$e');
      return Future.error(e, StackTrace.current);
    }
  }

  Future<Map<String, dynamic>> _makeRequest() async {
    Response response = await client.get(Urls.fakePharmacyUrl);
    if (response.statusCode != 200) {
      throw Failure('An error occurred', StackTrace.current);
    }
    return jsonDecode(response.body);
  }
}
