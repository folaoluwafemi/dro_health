import 'dart:math';

import 'package:dro_health/src/models//models.dart';
import 'package:dro_health/src/utils/constants/assets.dart';
import 'package:dro_health/src/utils/constants/constants.dart';
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
      requiresPrescription: map[Keys.medicineRequiresPrescription],
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
      Keys.medicineRequiresPrescription: medicine.requiresPrescription,
    };
    map.addAll(PackSizeFactory.toMap(medicine.packSize));
    map.addAll(SellerFactory.toMap(medicine.seller));
    return map;
  }

  static Medicine fake({required String name, required String imagePath, required String type}) {
    Seller seller = const Seller(
      name: 'Emzor Pharmaceuticals',
      imagePath: Assets.emzorLogo,
    );
    return Medicine(
      name: name,
      imagePath: imagePath,
      type: type,
      seller: seller,
      dispensationType: DispensationType.pack,
      packSize: generatePackSize(),
      price: generatePrice(),
      constituents: generateConstituents(),
      id: generateId(),
      requiresPrescription: Random().nextBool(),
    );
  }

  static double generatePrice() {
    int randInt = Random().nextInt(10);
    return randInt.isEven ? 350.0 : 600.0;
  }

  static String generateConstituents() {
    int randInt = Random().nextInt(10);
    return (randInt.isEven) ? 'Paracetamol' : 'Aspirin';
  }

  static PackSize generatePackSize() {
    int randInt = Random().nextInt(10);

    if (randInt.isEven) {
      return const PackSize(
        unit: 8,
        tablets: 12,
        weight: 500,
      );
    }
    return const PackSize(
      unit: 6,
      tablets: 10,
      weight: 1000,
    );
  }

  static String generateId() {
    int randInt1 = Random().nextInt(89) + 10;
    int randInt2 = Random().nextInt(89) + 10;
    int randInt3 = Random().nextInt(89) + 10;
    int randInt4 = Random().nextInt(89) + 10;

    return 'PRO$randInt1$randInt2$randInt3$randInt4';
  }
}
