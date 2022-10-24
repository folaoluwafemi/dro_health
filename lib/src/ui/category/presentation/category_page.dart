import 'package:dro_health/src/app/app_barrel.dart';
import 'package:dro_health/src/models/models.dart';
import 'package:dro_health/src/ui/category/bloc/category_bloc.dart';
import 'package:dro_health/src/ui/reuseable_widgets/reusable_widgets.dart';
import 'package:dro_health/src/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'category_detail_view.dart';

part 'category_view.dart';

class CategoryPage extends StatelessWidget {
  const CategoryPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size(
          double.infinity,
          120,
        ),
        child: Builder(builder: (context) {
          return Appbar(
            onBackPressed: () {
              context.read<CategoryCubit>().disposePage();
              Navigator.of(context).pop();
              return;
            },
            icon: Builder(builder: (builderContext) {
              return CartIcon(
                hasItems: builderContext
                        .watch<UserBloc>()
                        .state
                        .user
                        ?.cart
                        .isNotEmpty ??
                    false,
              );
            }),
          );
        }),
      ),
      body: BlocBuilder<CategoryCubit, CategoryState>(
        builder: (context, state) {
          if (state.detailIndex != null) {
            return _CategoryDetailView(
              categories: state.categories,
            );
          }
          return _CategoryView(
            categories: state.categories,
          );
        },
      ),
    );
  }
}
