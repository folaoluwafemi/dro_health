part of 'home_bloc.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();
}

class FetchCategories extends HomeEvent {
  @override
  List<Object?> get props => [];
}

class StartSearch extends HomeEvent {
  @override
  List<Object?> get props => [];
}

class SearchEvent extends HomeEvent {
  final String query;

  const SearchEvent({required this.query});

  @override
  List<Object?> get props => [query];
}

class EndSearch extends HomeEvent {
  @override
  List<Object?> get props => [];
}
