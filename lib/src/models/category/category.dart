import 'package:dro_health/src/models/medicine/medicine_model.dart';
import 'package:equatable/equatable.dart';

class Category extends Equatable {
  final String name;
  final String imagePath;
  final List<Medicine> medicines;

  const Category({
    required this.name,
    required this.imagePath,
    required this.medicines,
  });

  @override
  List<Object?> get props => [name, imagePath, medicines];
}
