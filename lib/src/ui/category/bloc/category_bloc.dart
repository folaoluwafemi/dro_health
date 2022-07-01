import 'dart:async';

import 'package:dro_health/src/app/locator/app_locator.dart';
import 'package:dro_health/src/data/data_barrel.dart';
import 'package:dro_health/src/models/category/category.dart';
import 'package:dro_health/src/utils/utils.dart';
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
    on<PageClosed>(_handlePageDisposed);
    on<SwitchDetails>(_switchDetails);
  }

  Future<void> _fetchCategories(
    FetchCategoryList event,
    Emitter<CategoryState> emit,
  ) async {
    List<Category> categories = [];
    if (state.categories.isEmpty) {
      categories.addAll(await repo.getCategories());
      emit(
        state.copyWith(
          categories: categories,
          status: StateStatus.loaded,
        ),
      );
      return;
    }
    emit(
      state.copyWith(
        status: StateStatus.loaded,
      ),
    );
  }

  Future<void> _switchDetails(
      SwitchDetails event, Emitter<CategoryState> emit) async {
    List<Category>? categories;
    if (state.categories.isEmpty) {
      categories = await repo.getCategories();
    }
    emit(
      state.copyWith(
        categories: categories,
        detailIndex: event.detailIndex,
      ),
    );
  }

  void _handlePageDisposed(PageClosed event, Emitter<CategoryState> emit) {
    emit(
      state.copyWith(
        categories: const [],
      ),
    );
  }
}
