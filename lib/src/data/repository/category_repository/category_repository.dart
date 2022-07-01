import 'package:dro_health/src/data/data_barrel.dart';
import 'package:dro_health/src/models/models.dart';

class CategoryRepository implements CategoryRepositoryInterface {
  final PharmacySourceInterface dataSource;

  CategoryRepository(this.dataSource);

  @override
  Future<List<Category>> getCategories() async {
    List<Category> categories = [];
    Pharmacy pharmacy = await dataSource.getPharmacy();

    categories.addAll(pharmacy.categories);
    return categories;
  }
}
