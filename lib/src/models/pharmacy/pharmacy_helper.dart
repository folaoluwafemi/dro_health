import 'package:dro_health/src/models//models.dart';
import 'package:dro_health/src/utils/constants/keys.dart';

class PharmacyHelper {
  static Pharmacy fromMap(Map<String, dynamic> map) {
    return Pharmacy(
      categories: castListTo<Category>(
        list: map[Keys.pharmacyCategories],
        caster: (rawCategory) => CategoryHelper.fromMap(rawCategory),
      ),
    );
  }

  static Map<String, dynamic> toMap(Pharmacy pharmacy) {
    return <String, dynamic>{
      Keys.pharmacyCategories: castListTo<Map<String, dynamic>>(
        list: pharmacy.categories,
        caster: (e) => CategoryHelper.toMap(e as Category),
      ),
    };
  }
}
