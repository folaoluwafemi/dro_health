part of 'category_bloc.dart';

enum CategoryStateStatus {
  loading,
  loaded,
}

class CategoryState extends Equatable {
  final List<Category> categories;
  final CategoryStateStatus status;
  final int? detailIndex;

  const CategoryState({
    this.status = CategoryStateStatus.loading,
    this.categories = const [],
    this.detailIndex,
  });

  CategoryState copyWith({
    List<Category>? categories,
    CategoryStateStatus? status,
    int? detailIndex,
  }) =>
      CategoryState(
        categories: categories ?? this.categories,
        status: status ?? this.status,
        detailIndex: detailIndex,
      );

  @override
  List<Object?> get props => [status, categories, detailIndex];
}
