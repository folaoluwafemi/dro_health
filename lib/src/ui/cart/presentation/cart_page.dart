import 'package:dro_health/src/app/app_barrel.dart';
import 'package:dro_health/src/ui/cart/bloc/cart_bloc.dart';
import 'package:dro_health/src/ui/cart/presentation/widgets/cart_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'cart_view.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CartBloc>(
      create: (context) => CartBloc(
        userBloc: context.read<UserBloc>(),
      )..add(CartFetched()),
      child: SafeArea(
        child: Scaffold(
          appBar: PreferredSize(
            preferredSize: const Size(double.maxFinite, 120),
            child: CartAppBar(onBackPressed: () => Navigator.of(context).pop()),
          ),
          body: const _CartView(),
        ),
      ),
    );
  }
}
