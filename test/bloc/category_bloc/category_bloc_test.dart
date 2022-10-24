import 'package:bloc_test/bloc_test.dart';
import 'package:dro_health/src/data/data_barrel.dart';
import 'package:dro_health/src/ui/category/bloc/category_bloc.dart';
import 'package:dro_health/src/utils/utils.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../utils/mocks/mock_client.dart';

void main() {
  late CategoryCubit bloc;
  setUp(() {
    bloc = CategoryCubit(
      repository: CategoryRepository(
        PharmacySource(
          MockClient(),
        ),
      ),
    );
  });

  group('Category blocs test', () {
    blocTest(
      'initial state of blocs is no state',
      build: () => bloc,
      expect: () => [],
    );

    test(
        'initial state of the blocs is an empty cateory list, a loading state and a null detailIndex',
        () {
      expect(bloc.state.categories.isEmpty, equals(true));
      expect(bloc.state.status, equals(StateStatus.loading));
      expect(bloc.state.detailIndex, equals(null));
    });
    test(
        'on fetch categories list added blocState\'s categories is not empty and status is loaded',
        () async {
      //act
      bloc.fetchCategories();
      await Future.delayed(Duration.zero);
      expect(bloc.state.categories.isNotEmpty, equals(true));
      expect(bloc.state.status, equals(StateStatus.loaded));
      expect(bloc.state.detailIndex, equals(null));
    });
    test(
        'on SwitchDetails added blocs state index is equal to the added event detail index',
        () async {
      //act
      bloc.fetchCategories();
      await Future.delayed(Duration.zero);
      bloc.switchDetails(detailIndex: 0);
      await Future.delayed(Duration.zero);

      expect(bloc.state.detailIndex, equals(0));
    });
  });
}
