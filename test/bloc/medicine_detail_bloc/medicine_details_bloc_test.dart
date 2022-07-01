import 'package:bloc_test/bloc_test.dart';
import 'package:dro_health/src/data/data_barrel.dart';
import 'package:dro_health/src/ui/medicine_detail/bloc/medicine_detail_bloc.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../utils/fake_data/fake_data.dart';
import '../../utils/mocks/mock_client.dart';

void main() {
  late MedicineDetailBloc bloc;
  setUp(() {
    bloc = MedicineDetailBloc(
      redParacetamol,
      repository: MedicineRepository(
        PharmacySource(
          MockClient(),
        ),
      ),
    );
  });

  group('initial tests', () {
    blocTest(
      'upon initialization emits nothing',
      build: () => bloc,
      expect: () => [],
    );
    test(
        'initial state is empty similar products list and must have a medicine '
        'and state\'s status should not be loading', () {
      expect(bloc.state.similarProducts.isEmpty, equals(true));
      expect(bloc.state.currentMedicine, isNotNull);
    });
  });

  group('event tests', () {
    test('on SimilarProductsFetched similarProducts list should not be empty',
        () async {
      //act
      bloc.add(SimilarProductsFetched());
      await Future.delayed(Duration.zero);
      expect(bloc.state.similarProducts.isNotEmpty, equals(true));
    });

    test(
        'on PackedQuantityChanged state\'s packetQuantity should be equal to added quantity',
        () async {
      //act
      bloc.add(const PacketQuantityChanged(2));
      await Future.delayed(Duration.zero);
      expect(bloc.state.packQuantity, equals(2)); // same as added quantity
    });

    test('on AddToCart added state\'s added to cart should be equal to true',
        () async {
      //act
      bloc.add(AddedToCart());
      await Future.delayed(Duration.zero);
      expect(bloc.state.addedToCart, equals(true)); // same as added quantity
    });
  });
}
