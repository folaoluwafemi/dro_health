import 'package:bloc_test/bloc_test.dart';
import 'package:dro_health/src/app/app_barrel.dart';
import 'package:dro_health/src/data/data_barrel.dart';
import 'package:dro_health/src/ui/cart/bloc/cart_bloc.dart';
import 'package:dro_health/src/utils/utils.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../utils/fake_data/fake_data.dart';
import '../../utils/mocks/mock_client.dart';

void main() {
  UserBloc userBloc = UserBloc(
    repository: UserRepository(
      UserSource(
        MockClient(),
      ),
    ),
  );

  late CartCubit bloc;
  setUp(() async {
    userBloc.add(UserFetched());
    await Future.delayed(Duration.zero);
    userBloc.add(UserCartItemAdded(cartItem1));
    bloc = CartCubit(
      userBloc: userBloc,
    );
  });

  group('initialization tests', () {
    blocTest(
      'emits nothing',
      build: () => bloc,
      expect: () => [],
    );

    test('bloc state is an empty cart item list and loading state', () {
      expect(bloc.state.cartItems.isEmpty, equals(true));
      expect(bloc.state.status, equals(StateStatus.loading));
    });
  });

  group('events tests', () {
    test('on CartFetched state\'s cart list is equal to user\'s cart list',
        () async {
      bloc.fetchCart();
      await Future.delayed(Duration.zero);
      expect(bloc.state.cartItems, equals(userBloc.state.user?.cart));
    });
    test(
        'on CartItemCountChanged the corresponding cartItem\'s quantity changes',
        () async {
      bloc.fetchCart();
      await Future.delayed(Duration.zero);
      bloc.changeCartItemCount(item: cartItem1, newCount: 3);
      await Future.delayed(Duration.zero);
      expect(bloc.state.cartItems[0], cartItem1.copyWith(quantity: 3));
    });
    test(
        'on CartItemRemoved the corresponding cartItem\'s should not exist'
        ' in both bloc state\'s cartItem list and userBloc user cart item list',
        () async {
      //setup
      bloc.fetchCart();
      await Future.delayed(Duration.zero);
      //act
      bloc.removeCartItem(cartItem1);
      await Future.delayed(Duration.zero);
      expect(bloc.state.cartItems.contains(cartItem1), equals(false));
      expect(userBloc.state.user?.cart.contains(cartItem1), equals(false));
    });
    test(
        'on CartItemRemoved the corresponding cartItem\'s should not exist'
        ' in bloc state\'s cartItem list', () async {
      //setup
      bloc.fetchCart();
      await Future.delayed(Duration.zero);
      //act
      bloc.removeCartItem(cartItem1);
      await Future.delayed(Duration.zero);
      expect(bloc.state.cartItems.contains(cartItem1), equals(false));
    });
    test(
        'on CheckedOut userBloc state\'s cartItem list should be equal to'
        ' bloc state\'s cart item list', () async {
      //setup
      bloc.fetchCart();
      await Future.delayed(Duration.zero);
      //act
      bloc.changeCartItemCount(item: cartItem1, newCount: 3);
      await Future.delayed(Duration.zero);
      bloc.addCartToUserAndCheckout();
      await Future.delayed(Duration.zero);

      expect(bloc.state.cartItems, equals(userBloc.state.user?.cart));

      //act 2
      bloc.removeCartItem(cartItem1);
      await Future.delayed(Duration.zero);
      bloc.addCartToUserAndCheckout();
      await Future.delayed(Duration.zero);

      expect(bloc.state.cartItems, equals(userBloc.state.user?.cart));
    });
  });
}
