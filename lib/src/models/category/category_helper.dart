import 'package:dro_health/src/models//models.dart';
import 'package:dro_health/src/utils/constants/keys.dart';

class CategoryHelper {
  static Category fromMap(Map<String, dynamic> map) {
    return Category(
      name: map[Keys.categoryName],
      imagePath: map[Keys.categoryImage],
      medicines: castListTo<Medicine>(
        list: map[Keys.categoryMedicines],
        caster: (e) => MedicineModelHelper.fromMap(e),
      ),
    );
  }

  static Map<String, dynamic> toMap(Category category) {
    return <String, dynamic>{
      Keys.categoryName: category.name,
      Keys.categoryImage: category.imagePath,
      Keys.categoryMedicines: castListTo<Map<String, dynamic>>(
        list: category.medicines,
        caster: (medicine) => MedicineModelHelper.toMap(medicine),
      ),
    };
  }
}
