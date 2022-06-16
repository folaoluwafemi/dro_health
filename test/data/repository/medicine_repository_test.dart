import 'package:dro_health/src/data/data.dart';
import 'package:dro_health/src/models/models.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../utils/mocks/mock_client.dart';

void main() {
  late MedicineRepository medicineRepository;
  setUpAll(() {
    medicineRepository = MedicineRepository(
      PharmacySource(
        MockClient(),
      ),
    );
  });

  group('medicineRepository.getAllMedicines() tess', () {
    test('returns normally', () {
      expectLater(medicineRepository.getAllMedicines, returnsNormally);
    });
    test('returns a non-empty list of medicines', () async {
      List<Medicine> results = await medicineRepository.getAllMedicines();

      expect(results.isNotEmpty, equals(true));
    });
    test('returns a list of medicines that has NO repetitions', () async {
      List<Medicine> results = await medicineRepository.getAllMedicines();

      expect(hasRepetitions(results), equals(false));
    });
  });

  group('medicineRepository.searchMedicines(query: query) tests', () {
    test('returns normally', () {
      expect(
        () => medicineRepository.searchMedicines(query: 'any random query'),
        returnsNormally,
      );
    });
    test('returns a non-empty list on a valid query', () async {
      //act
      List<Medicine> result = await medicineRepository.searchMedicines(
        query: '',
      );
      expect(result.isNotEmpty, equals(true));
    });
  });
}

bool hasRepetitions(List list) {
  int i = 0;
  int j = 0;

  while (i < list.length) {
    if (list[i] == list[j] && i != j) {
      return true;
    }
    if (j == (list.length - 1)) {
      i++;
      j = 0;
    }
    j++;
  }
  return false;
}
