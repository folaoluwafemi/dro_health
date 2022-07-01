import 'package:dro_health/src/data/data_barrel.dart';
import 'package:dro_health/src/models/models.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../utils/mocks/mock_client.dart';

void main() {
  late CategoryRepository categoryRepository;
  setUpAll(() {
    categoryRepository = CategoryRepository(
      PharmacySource(MockClient()),
    );
  });

  group('categoryRepository.getCategories() tests', () {
    test('returns normally', () {
      expectLater(categoryRepository.getCategories, returnsNormally);
    });

    test('returns a non-empty list', () async {
      //act
      List<Category> result = await categoryRepository.getCategories();

      expect(result.isNotEmpty, equals(true));
    });
  });
}
