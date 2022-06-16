import 'package:dro_health/src/data/data.dart';
import 'package:dro_health/src/models/models.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../utils/mocks/mock_client.dart';

void main() {
  late UserSource userSource;

  setUpAll(() {
    userSource = UserSource(MockClient());
  });

  group('userSource.getUser() tests', () {
    test('returns normally', () {
      expectLater(userSource.getUser, returnsNormally);
    });

    test('returns an instance of User', () async {
      //act
      var result = await userSource.getUser();

      expect(result, isA<User>());
    });
  });
}
