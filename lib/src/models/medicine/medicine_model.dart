import 'package:equatable/equatable.dart';

part 'pack_size.dart';

part 'seller.dart';

class Medicine extends Equatable {
  final String id;
  final String name;
  final String imagePath;
  final PackSize packSize;
  final String constituents;
  final String dispensationType;
  final String type;
  final double price;
  final Seller seller;
  final bool requiresPrescription;

  const Medicine({
    required this.id,
    required this.name,
    required this.imagePath,
    required this.packSize,
    required this.constituents,
    required this.dispensationType,
    required this.requiresPrescription,
    required this.type,
    required this.price,
    required this.seller,
  });

  Medicine copyWith({
    String? id,
    String? name,
    String? imagePath,
    PackSize? packSize,
    String? constituents,
    String? dispensationType,
    String? type,
    double? price,
    Seller? seller,
    bool? requiresPrescription,
  }) =>
      Medicine(
        id: id ?? this.id,
        name: name ?? this.name,
        imagePath: imagePath ?? this.imagePath,
        packSize: packSize ?? this.packSize,
        constituents: constituents ?? this.constituents,
        dispensationType: dispensationType ?? this.dispensationType,
        type: type ?? this.type,
        price: price ?? this.price,
        seller: seller ?? this.seller,
        requiresPrescription: requiresPrescription ?? this.requiresPrescription,
      );

  @override
  List<Object?> get props => [
        id,
        name,
        imagePath,
        packSize,
        constituents,
        dispensationType,
        type,
        price,
        seller,
      ];
}
