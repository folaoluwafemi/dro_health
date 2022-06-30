import 'dart:async';

import 'package:dro_health/src/app/locator/app_locator.dart';
import 'package:dro_health/src/data/data.dart';
import 'package:dro_health/src/models/category/category.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'category_event.dart';

part 'category_state.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  final CategoryRepositoryInterface repo;

  CategoryBloc({
    CategoryRepositoryInterface? repository,
  })  : repo = repository ?? locator<CategoryRepositoryInterface>(),
        super(const CategoryState()) {
    on<FetchCategoryList>(_fetchCategories);
    on<SwitchDetails>(_switchDetails);
  }

  void _fetchCategories(
    FetchCategoryList event,
    Emitter<CategoryState> emit,
  ) async {
    List<Category> categories = [];
    if (state.categories.isEmpty) {
      categories.addAll(await repo.getCategories());
      emit(
        state.copyWith(
          categories: categories,
          status: CategoryStateStatus.loaded,
        ),
      );
      return;
    }
    emit(
      state.copyWith(
        status: CategoryStateStatus.loaded,
      ),
    );
  }

  FutureOr<void> _switchDetails(
      SwitchDetails event, Emitter<CategoryState> emit) async {
    if (state.categories.isEmpty) {
      add(FetchCategoryList());
      await Future.delayed(Duration.zero);
    }
    emit(
      state.copyWith(
        detailIndex: event.detailIndex,
      ),
    );
  }
}
