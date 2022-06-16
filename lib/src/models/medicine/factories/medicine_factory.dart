import 'package:dro_health/src/models//models.dart';
import 'package:dro_health/src/utils/constants/keys.dart';

part 'pack_size_factory.dart';

part 'seller_factory.dart';

class MedicineFactory {
  static Medicine fromMap(Map<String, dynamic> map) {
    return Medicine(
      id: map[Keys.medicineId],
      name: map[Keys.medicineName],
      imagePath: map[Keys.medicineImagePath],
      packSize: PackSizeFactory.fromMap(map),
      constituents: map[Keys.medicineConstituents],
      dispensationType: map[Keys.medicineConstituents],
      type: map[Keys.medicineType],
      price: map[Keys.medicinePrice],
      seller: SellerFactory.fromMap(map),
    );
  }

  static Map<String, dynamic> toMap(Medicine medicine) {
    Map<String, dynamic> map = <String, dynamic>{
      Keys.medicineId: medicine.id,
      Keys.medicineName: medicine.name,
      Keys.medicineImagePath: medicine.imagePath,
      Keys.medicineConstituents: medicine.constituents,
      Keys.medicineDispensationType: medicine.dispensationType,
      Keys.medicineType: medicine.type,
      Keys.medicinePrice: medicine.price,
    };
    map.addAll(PackSizeFactory.toMap(medicine.packSize));
    map.addAll(SellerFactory.toMap(medicine.seller));
    return map;
  }
}
