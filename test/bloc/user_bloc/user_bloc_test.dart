import 'package:bloc_test/bloc_test.dart';
import 'package:dro_health/src/app/blocs/user_bloc/user_bloc.dart';
import 'package:dro_health/src/data/data_barrel.dart';
import 'package:dro_health/src/utils/utils.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../utils/fake_data/fake_data.dart';
import '../../utils/mocks/mock_client.dart';

void main() {
  late UserBloc bloc;
  setUp(() {
    bloc = UserBloc(
      repository: UserRepository(
        UserSource(
          MockClient(),
        ),
      ),
    );
  });

  group('on initialization tests', () {
    blocTest(
      'on initialized no state is emitted',
      build: () => bloc,
      expect: () => [],
    );
    test(
        'on initialized userState\'s user is null and userState status is loading',
        () {
      expect(bloc.state.user, isNull);
      expect(bloc.state.status, equals(StateStatus.loading));
    });
  });

  group('event tests', () {
    test(
        'on UserFetched added, userState\'s user is not null and userState status is loaded',
        () async {
      bloc.add(UserFetched());
      await Future.delayed(Duration.zero);
      expect(bloc.state.user, isNotNull);
      expect(bloc.state.status, equals(StateStatus.loaded));
    });
    test(
        'on UserCartItemAdded added, userState\'s user\'s cartItem list contains the added cartItem',
        () async {
      bloc.add(UserFetched());
      await Future.delayed(Duration.zero);
      bloc.add(UserCartItemAdded(cartItem1));
      await Future.delayed(Duration.zero);

      expect(bloc.state.user?.cart.contains(cartItem1), equals(true));
    });
    test(
        'on UserCartItemRemoved added, userState\'s user\'s cart should NOT contain the added cartItem',
        () async {
      bloc.add(UserFetched());
      await Future.delayed(Duration.zero);
      bloc.add(UserCartItemRemoved(cartItem1));
      await Future.delayed(Duration.zero);

      expect(bloc.state.user?.cart.contains(cartItem1), equals(false));
    });
    test(
        'on UserCartChanged added, userState\'s user\'s cart should be equal to the added cart',
        () async {
      bloc.add(UserFetched());
      await Future.delayed(Duration.zero);
      bloc.add(UserCartChanged([cartItem1, cartItem2]));
      await Future.delayed(Duration.zero);

      expect(bloc.state.user?.cart, equals([cartItem1, cartItem2]));
    });
  });
}
