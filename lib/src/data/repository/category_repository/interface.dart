import 'package:dro_health/src/models/category/category.dart';

abstract class CategoryRepositoryInterface {
  Future<List<Category>> getCategories();
}
