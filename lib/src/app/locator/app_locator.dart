import 'package:dro_health/src/data/data.dart';
import 'package:get_it/get_it.dart';

GetIt getIt = GetIt.I;

void setupLocator() {
  getIt.registerLazySingleton<UserSourceInterface>(
    () => UserSource(),
  );
  getIt.registerLazySingleton<PharmacySourceInterface>(
    () => PharmacySource(),
  );
  getIt.registerLazySingleton<CategoryRepositoryInterface>(
    () => CategoryRepository(),
  );
  getIt.registerLazySingleton<MedicineRepositoryInterface>(
    () => MedicineRepository(),
  );
  getIt.registerLazySingleton<UserRepositoryInterface>(
    () => UserRepository(),
  );
}
