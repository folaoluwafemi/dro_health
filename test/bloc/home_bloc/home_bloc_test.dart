import 'package:bloc_test/bloc_test.dart';
import 'package:dro_health/src/data/data_barrel.dart';
import 'package:dro_health/src/ui/home/bloc/home_bloc.dart';
import 'package:dro_health/src/utils/utils.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../utils/mocks/mock_client.dart';

void main() {
  PharmacySource mockSource = PharmacySource(MockClient());
  CategoryRepository mockRepo = CategoryRepository(mockSource);

  group('tests for home blocs', () {
    late HomeCubit bloc;
    setUp(() {
      bloc = HomeCubit(categoryRepository: mockRepo);
    });

    blocTest(
      'when the blocs is initialized the state is empty',
      build: () => bloc,
      expect: () => [],
    );
    test('when the fetch categories is added state is not empty', () async {
      //act
      bloc.fetchCategories();
      await Future.delayed(Duration.zero);

      expect(bloc.state.status, equals(StateStatus.loaded));
      expect(bloc.state.categories.isNotEmpty, equals(true));
      expect(bloc.state.search, equals(false));
    });
    test(
        'when the StartSearch is added state emit a HomeState whose search is true',
        () async {
      //act
      bloc.startSearch();
      await Future.delayed(Duration.zero);

      expect(bloc.state.search, equals(true));
    });
    test(
        'when the EndSearch is added state emit a HomeState whose search is false',
        () async {
      //act
      bloc.endSearch();
      await Future.delayed(Duration.zero);

      expect(bloc.state.search, equals(false));
    });
    test(
        'when the SearchEvent is added homeBloc emits a HomeState with a list '
        'of medicines corresponding to the query', () async {
      //act
      bloc.fetchCategories();
      await Future.delayed(Duration.zero);
      bloc.search('');
      await Future.delayed(Duration.zero);

      expect(bloc.state.search, equals(true));
      expect(bloc.state.medicines.isNotEmpty, equals(true));
    });
  });
}
