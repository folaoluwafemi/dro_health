part of 'medicine_model.dart';

class PackSize extends Equatable {
  final int unit;
  final int tablets;
  final double weight;

  const PackSize({
    required this.unit,
    required this.tablets,
    required this.weight,
  });

  int get totalSize => unit * tablets;

  @override
  List<Object?> get props => [
        unit,
        tablets,
        weight,
      ];

  PackSize copyWith({
    int? unit,
    int? tablets,
    double? weight,
  }) =>
      PackSize(
        unit: unit ?? this.unit,
        tablets: tablets ?? this.tablets,
        weight: weight ?? this.weight,
      );
}
