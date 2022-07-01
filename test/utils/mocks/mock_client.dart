import 'dart:convert';

import 'package:dro_health/src/models/models.dart';
import 'package:dro_health/src/utils/utils.dart';
import 'package:http/http.dart';
import 'package:mockito/mockito.dart';

import '../fake_data/fake_data.dart';

class MockClient extends Mock implements Client {
  @override
  Future<Response> get(
    Uri url, {
    Map<String, String>? headers,
  }) {
    if (url.toString().contains(Strings.pharmacyL)) {
      return Future.value(Response(_getPharmacy(), 200));
    }
    if (url.toString().contains(Strings.userL)) {
      return Future.value(Response(getUser(), 200));
    }
    return Future.value(Response('Nothing to see here', 404));
  }

  String _getPharmacy() {
    Pharmacy pharmacy = Pharmacy(
      categories: _createCategories(),
    );

    return jsonEncode(PharmacyHelper.toMap(pharmacy));
  }

  List<Category> _createCategories() {
    return <Category>[
      supplementsCategory,
      coughCategory,
      headacheCategory,
      infantsCategory,
    ];
  }
}
