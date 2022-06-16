import 'package:equatable/equatable.dart';

class Category extends Equatable {
  final String name;
  final String imagePath;

  const Category({
    required this.name,
    required this.imagePath,
  });

  @override
  List<Object?> get props => [name, imagePath];
}
