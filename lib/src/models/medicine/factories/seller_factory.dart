part of 'medicine_factory.dart';

class SellerFactory {
  static Seller fromMap(Map<String, dynamic> map) {
    return Seller(
      name: map[Keys.medicineSellerName],
      imagePath: map[Keys.medicineSellerImagePath],
    );
  }

  static Map<String, dynamic> toMap(Seller seller) {
    return <String, dynamic>{
      Keys.medicineSellerName: seller.name,
      Keys.medicineSellerImagePath: seller.imagePath,
    };
  }
}
