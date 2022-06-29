import 'package:bloc_test/bloc_test.dart';
import 'package:dro_health/src/data/data.dart';
import 'package:dro_health/src/ui/home/bloc/home_bloc.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../utils/mocks/mock_client.dart';

void main() {
  PharmacySource mockSource = PharmacySource(MockClient());
  CategoryRepository mockRepo = CategoryRepository(mockSource);

  group('tests for home bloc', () {
    late HomeBloc bloc;
    setUp(() {
      bloc = HomeBloc(categoryRepository: mockRepo);
    });

    blocTest(
      'when the bloc is initialized the state is empty',
      build: () => bloc,
      expect: () => [],
    );
    test('when the fetch categories is added state is not empty', () async {
      //act
      bloc.add(FetchCategories());
      await Future.delayed(Duration.zero);

      expect(bloc.state.status, equals(HomeStateStatus.loaded));
      expect(bloc.state.categories.isNotEmpty, equals(true));
      expect(bloc.state.search, equals(false));
    });
    test(
        'when the StartSearch is added state emit a HomeState whose search is true',
        () async {
      //act
      bloc.add(StartSearch());
      await Future.delayed(Duration.zero);

      expect(bloc.state.search, equals(true));
    });
    test(
        'when the EndSearch is added state emit a HomeState whose search is false',
        () async {
      //act
      bloc.add(EndSearch());
      await Future.delayed(Duration.zero);

      expect(bloc.state.search, equals(false));
    });
    test(
        'when the SearchEvent is added homeBloc emits a HomeState with a list '
        'of medicines corresponding to the query', () async {
      //act
      bloc.add(const SearchEvent(query: ''));
      await Future.delayed(Duration.zero);

      expect(bloc.state.search, equals(true));
      expect(bloc.state.medicines.isNotEmpty, equals(true));
    });
  });
}
