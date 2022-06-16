import 'package:dro_health/src/models//models.dart';
import 'package:equatable/equatable.dart';

class Pharmacy extends Equatable {
  final List<Medicine> medicines;
  final List<Category> categories;

  const Pharmacy({
    required this.medicines,
    required this.categories,
  });

  Pharmacy copyWith({
    List<Medicine>? medicines,
    List<Category>? categories,
  }) =>
      Pharmacy(
        medicines: medicines ?? this.medicines,
        categories: categories ?? this.categories,
      );

  @override
  List<Object?> get props => [medicines, categories];
}
