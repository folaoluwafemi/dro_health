import 'dart:async';

import 'package:dro_health/src/app/locator/app_locator.dart';
import 'package:dro_health/src/data/data_barrel.dart';
import 'package:dro_health/src/models/models.dart';
import 'package:dro_health/src/utils/utils.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> with ErrorHandler {
  final CategoryRepositoryInterface _repo;

  HomeCubit({
    CategoryRepositoryInterface? categoryRepository,
  })  : _repo = categoryRepository ?? locator<CategoryRepositoryInterface>(),
        super(const HomeState());

  // {
  //   on<FetchCategories>(fetchCategories);
  //   on<StartSearch>(startSearch);
  //   on<EndSearch>(endSearch);
  //   on<SearchEvent>(search);
  // }

  Future<void> fetchCategories() async {
    simpleErrorHandler(computation: () async {
      List<Category> categories = await _repo.getCategories();
      List<Medicine> medicines = getMedicinesFromCategories(categories);
      emit(
        state.copyWith(
          categories: categories,
          medicines: medicines,
          status: StateStatus.loaded,
        ),
      );
    });
  }

  Future<void> startSearch() async {
    emit(
      state.copyWith(search: true),
    );
  }

  void endSearch() {
    emit(
      state.copyWith(
        medicines: getMedicinesFromCategories(
          state.categories,
        ),
        search: false,
      ),
    );
  }

  void search(String query) {
    List<Medicine> medicines = getMedicinesFromCategories(state.categories);

    List<Medicine> searchedMedicines = medicines.where((Medicine medicine) {
      return medicine.name.toLowerCase().contains(query.toLowerCase());
    }).toList();

    emit(
      state.copyWith(
        search: true,
        medicines: searchedMedicines,
      ),
    );
  }
}
