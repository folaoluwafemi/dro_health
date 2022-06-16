import 'package:dro_health/src/models//models.dart';
import 'package:dro_health/src/utils/constants/keys.dart';

class CategoryFactory {
  static Category fromMap(Map<String, dynamic> map) {
    return Category(
      name: map[Keys.categoryName],
      imagePath: map[Keys.categoryImage],
    );
  }

  static Map<String, dynamic> toMap(Category category) {
    return <String, dynamic>{
      Keys.categoryName: category.name,
      Keys.categoryImage: category.imagePath,
    };
  }

}
