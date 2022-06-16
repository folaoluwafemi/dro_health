import 'package:dro_health/src/models//models.dart';
import 'package:dro_health/src/utils/constants/keys.dart';

class PharmacyFactory {
  static Pharmacy fromMap(Map<String, dynamic> map) {
    return Pharmacy(
      medicines: castListTo<Medicine>(
          list: map[Keys.pharmacyMedicines],
          caster: (dynamic rawMedicine) {
            return MedicineFactory.fromMap(rawMedicine);
          }),
      categories: castListTo<Category>(
        list: map[Keys.pharmacyCategories],
        caster: (rawCategory) => CategoryFactory.fromMap(rawCategory),
      ),
    );
  }

  static Map<String, dynamic> toMap(Pharmacy pharmacy) {
    return <String, dynamic>{
      Keys.pharmacyMedicines: castListTo<Map<String, dynamic>>(
        list: pharmacy.medicines,
        caster: (e) => MedicineFactory.toMap(e as Medicine),
      ),
      Keys.pharmacyCategories: castListTo<Map<String, dynamic>>(
        list: pharmacy.categories,
        caster: (e) => CategoryFactory.toMap(e as Category),
      ),
    };
  }
}
