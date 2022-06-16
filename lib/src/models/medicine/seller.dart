part of 'medicine_model.dart';

class Seller extends Equatable {
  final String name;
  final String imagePath;

  const Seller({
    required this.name,
    required this.imagePath,
  });

  @override
  List<Object?> get props => [name, imagePath];
}
