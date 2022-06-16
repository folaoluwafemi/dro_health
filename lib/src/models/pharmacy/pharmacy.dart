import 'package:dro_health/src/models//models.dart';
import 'package:equatable/equatable.dart';

class Pharmacy extends Equatable {
  final List<Category> categories;

  const Pharmacy({
    required this.categories,
  });

  Pharmacy copyWith({
    List<Medicine>? medicines,
    List<Category>? categories,
  }) =>
      Pharmacy(
        categories: categories ?? this.categories,
      );

  @override
  List<Object?> get props => [categories];
}
