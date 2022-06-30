import 'package:bloc_test/bloc_test.dart';
import 'package:dro_health/src/data/data.dart';
import 'package:dro_health/src/ui/category/bloc/category_bloc.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../utils/mocks/mock_client.dart';

void main() {
  late CategoryBloc bloc;
  setUp(() {
    bloc = CategoryBloc(
      repository: CategoryRepository(
        PharmacySource(
          MockClient(),
        ),
      ),
    );
  });

  group('Category bloc test', () {
    blocTest(
      'initial state of bloc is no state',
      build: () => bloc,
      expect: () => [],
    );

    test(
        'initial state of the bloc is an empty cateory list, a loading state and a null detailIndex',
        () {
      expect(bloc.state.categories.isEmpty, equals(true));
      expect(bloc.state.status, equals(CategoryStateStatus.loading));
      expect(bloc.state.detailIndex, equals(null));
    });
    test(
        'on fetch categories list added blocState\'s categories is not empty and status is loaded',
        () async {
      //act
      bloc.add(FetchCategoryList());
      await Future.delayed(Duration.zero);
      expect(bloc.state.categories.isNotEmpty, equals(true));
      expect(bloc.state.status, equals(CategoryStateStatus.loaded));
      expect(bloc.state.detailIndex, equals(null));
    });
    test('on SwitchDetails added bloc state index is equal to the added event detail index', () async {
      //act
      bloc.add(FetchCategoryList());
      await Future.delayed(Duration.zero);
      bloc.add(const SwitchDetails(detailIndex: 0));
      await Future.delayed(Duration.zero);

      expect(bloc.state.detailIndex, equals(0));
    });
  });
}
