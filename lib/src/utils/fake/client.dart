import 'dart:convert';

import 'package:dro_health/src/models/models.dart';
import 'package:dro_health/src/utils/constants/assets.dart';
import 'package:dro_health/src/utils/constants/constants.dart';
import 'package:dro_health/src/utils/constants/strings.dart';
import 'package:dro_health/src/utils/fake/interfaces.dart';
import 'package:http/http.dart';

class FakeClient extends FakeClientInterface {
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

    return jsonEncode(PharmacyFactory.toMap(pharmacy));
  }

  List<Category> _createCategories() {
    Category headacheCategory = Category(
      name: Strings.headache,
      imagePath: Assets.headacheCategory,
      medicines: [
        _panadol,
        _redParacetamol,
        _orangeParacetamol,
      ],
    );
    Category supplementsCategory = Category(
      name: Strings.supplements,
      imagePath: Assets.supplementsCategory,
      medicines: [
        _doliprane,
        _panadol,
      ],
    );
    Category infantsCategory = Category(
      name: Strings.infants,
      imagePath: Assets.infantCategory,
      medicines: [
        _redParacetamol,
        _redIbuprofen,
      ],
    );
    Category coughCategory = Category(
      name: Strings.cough,
      imagePath: Assets.coughCategory,
      medicines: [
        _redParacetamol,
        _orangeParacetamol,
        _redIbuprofen,
        _orangeIbuprofen,
        _doliprane,
        _panadol,
      ],
    );

    return <Category>[
      supplementsCategory,
      coughCategory,
      headacheCategory,
      infantsCategory,
    ];
  }

  final Medicine _redParacetamol = MedicineFactory.fake(
    name: Strings.paracetamol,
    imagePath: Assets.redParacetamol,
    type: MedicineType.tablet,
  );

  final Medicine _orangeParacetamol = MedicineFactory.fake(
    name: Strings.paracetamol,
    imagePath: Assets.orangeParacetamol,
    type: MedicineType.tablet,
  );

  final Medicine _redIbuprofen = MedicineFactory.fake(
    name: Strings.ibuprofen,
    imagePath: Assets.ibuprofenRed,
    type: MedicineType.tablet,
  );

  final Medicine _orangeIbuprofen = MedicineFactory.fake(
    name: Strings.ibuprofen,
    imagePath: Assets.ibuprofenOrange,
    type: MedicineType.tablet,
  );

  final Medicine _doliprane = MedicineFactory.fake(
    name: Strings.doliprane,
    imagePath: Assets.doliprane,
    type: MedicineType.capsule,
  );
  final Medicine _panadol = MedicineFactory.fake(
    name: Strings.panadol,
    imagePath: Assets.panadol,
    type: MedicineType.tablet,
  );

  String getUser() {
    User newUser = _createUser();
    String rawUser = jsonEncode(UserFactory.toMap(newUser));
    return rawUser;
  }

  User _createUser() {
    return const User(
      email: 'random@email.com',
      name: 'John Doe',
      cart: [],
      favorites: [],
    );
  }
}
