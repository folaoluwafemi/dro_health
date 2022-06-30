part of 'category_bloc.dart';

abstract class CategoryEvent extends Equatable {
  const CategoryEvent();
}

class FetchCategoryList extends CategoryEvent {
  @override
  List<Object?> get props => [];
}

class SwitchDetails extends CategoryEvent {
  final int? detailIndex;

  const SwitchDetails({this.detailIndex});

  @override
  List<Object?> get props => [detailIndex];
}
