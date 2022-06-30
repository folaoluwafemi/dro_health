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

class CategoryPage extends StatefulWidget {
  const CategoryPage({
    Key? key,
  }) : super(key: key);

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  @override
  void initState() {
    super.initState();
    context.read<CategoryBloc>().add(FetchCategoryList());
  }

  @override
  void dispose() {
    context.read<CategoryBloc>().add(PageDisposed());
    super.dispose();
  }

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
              if (context.read<CategoryBloc>().state.detailIndex == null) {
                Navigator.of(context).pop();
                return;
              }
              context.read<CategoryBloc>().add(const SwitchDetails());
            },
            icon: const DeliveryIcon(),
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
