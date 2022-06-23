part of 'medicine_helper.dart';

class PackSizeHelper {
  static PackSize fromMap(Map<String, dynamic> map) {
    return PackSize(
      unit: map[Keys.medicinePackUnit],
      tablets: map[Keys.medicinePackTablets],
      weight: map[Keys.medicinePackWeight],
    );
  }

  static Map<String, dynamic> toMap(PackSize packSize) {
    return <String, dynamic>{
      Keys.medicinePackUnit: packSize.unit,
      Keys.medicinePackTablets: packSize.tablets,
      Keys.medicinePackWeight : packSize.weight,
    };
  }
}
