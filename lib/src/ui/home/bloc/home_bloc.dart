import 'dart:async';

import 'package:dro_health/src/app/locator/app_locator.dart';
import 'package:dro_health/src/data/data_barrel.dart';
import 'package:dro_health/src/models/models.dart';
import 'package:dro_health/src/utils/utils.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'home_event.dart';

part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> with ErrorHandler {
  final CategoryRepositoryInterface _repo;

  HomeBloc({
    CategoryRepositoryInterface? categoryRepository,
  })  : _repo = categoryRepository ?? locator<CategoryRepositoryInterface>(),
        super(const HomeState()) {
    on<FetchCategories>(_fetchCategories);
    on<StartSearch>(_startSearch);
    on<EndSearch>(_endSearch);
    on<SearchEvent>(_search);
  }

  Future<void> _fetchCategories(
    FetchCategories event,
    Emitter<HomeState> emit,
  ) async {
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

  Future<void> _startSearch(
    StartSearch event,
    Emitter<HomeState> emit,
  ) async {
    emit(
      state.copyWith(search: true),
    );
  }

  void _endSearch(
    EndSearch event,
    Emitter<HomeState> emit,
  ) {
    emit(
      state.copyWith(
        medicines: getMedicinesFromCategories(
          state.categories,
        ),
        search: false,
      ),
    );
  }

  void _search(SearchEvent event, Emitter<HomeState> emit) {
    String query = event.query;
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
