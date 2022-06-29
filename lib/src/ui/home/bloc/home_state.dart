part of 'home_bloc.dart';

enum HomeStateStatus {
  loading,
  loaded,
}

class HomeState extends Equatable {
  final HomeStateStatus status;
  final List<Category> categories;
  final List<Medicine> medicines;
  final bool search;

  const HomeState(
      {
    this.medicines = const [],
    this.status = HomeStateStatus.loading,
    this.search = false,
    this.categories = const [],
  });

  HomeState copyWith({
    HomeStateStatus? status,
    List<Category>? categories,
    List<Medicine>? medicines,
    bool? search,
  }) =>
      HomeState(
        search: search ?? this.search,
        status: status ?? this.status,
        categories: categories ?? this.categories,
        medicines: medicines ?? this.medicines,
      );

  @override
  String toString() {
    return 'status: $status\n'
        'search: $search\n'
        'medicines: $medicines\n'
        'categories: $categories\n';
  }

  @override
  List<Object?> get props => [search, status, categories, medicines];
}
