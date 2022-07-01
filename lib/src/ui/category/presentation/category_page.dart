import 'package:dro_health/src/app/theme/colors.dart';
import 'package:dro_health/src/models/models.dart';
import 'package:dro_health/src/ui/category/bloc/category_bloc.dart';
import 'package:dro_health/src/ui/reuseable_widgets/functions/methods.dart';
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
              // if (context.read<CategoryBloc>().state.detailIndex == null) {
              context.read<CategoryBloc>().add(PageClosed());
              Navigator.of(context).pop();
              return;
              // }
              // context.read<CategoryBloc>().add(const SwitchDetails());
            },
            icon: const CartIcon(
              hasItems: true,
            ),
          );
        }),
      ),
      body: BlocBuilder<CategoryBloc, CategoryState>(
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
