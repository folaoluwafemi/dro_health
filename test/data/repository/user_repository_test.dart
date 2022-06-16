import 'package:dro_health/src/data/data.dart';
import 'package:dro_health/src/models/models.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../utils/mocks/mock_client.dart';

void main() {
  late UserRepository userRepository;

  setUpAll(() {
    userRepository = UserRepository(
      UserSource(
        MockClient(),
      ),
    );
  });

  group('userRepository.getUser() tests', () {
    test('returns normally', () {
      expectLater(userRepository.getUser, returnsNormally);
    });
    test('returns an instance of User', () async {
      //act
      var result = await userRepository.getUser();
      expect(result, isA<User>());
    });
  });
}
