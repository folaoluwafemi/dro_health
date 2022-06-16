import 'package:dro_health/src/data/data.dart';
import 'package:dro_health/src/models/models.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../utils/mocks/mock_client.dart';

void main() {
  late PharmacySource pharmacySource;
  setUpAll(() {
    pharmacySource = PharmacySource(MockClient());
  });

  group('pharmacySource.getPharmacy tests', () {
    test('calling getPharmacy returns normally', () {
      expectLater(pharmacySource.getPharmacy, returnsNormally);
    });

    test('pharmacySource.getPharmacy returns an instance of Pharmacy',
        () async {
      //act
      var result = await pharmacySource.getPharmacy();

      expect(result, isA<Pharmacy>());
    });
    test('pharmacySource.getPharmacy returns a non-empty Category list',
        () async {
      //act
      Pharmacy pharmacy = await pharmacySource.getPharmacy();

      expect(pharmacy.categories.isNotEmpty, equals(true));
    });
  });
}
