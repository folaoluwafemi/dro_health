part of 'category_bloc.dart';

class CategoryState extends Equatable {
  final List<Category> categories;
  final StateStatus status;
  final int? detailIndex;

  const CategoryState({
    this.status = StateStatus.loading,
    this.categories = const [],
    this.detailIndex,
  });

  CategoryState copyWith({
    List<Category>? categories,
    StateStatus? status,
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
