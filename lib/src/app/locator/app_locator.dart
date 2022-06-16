import 'package:dro_health/src/data/data.dart';
import 'package:dro_health/src/utils/fake/client.dart';
import 'package:get_it/get_it.dart';

GetIt getIt = GetIt.I;

void setupLocator() {
  getIt.registerLazySingleton<UserSourceInterface>(
    () => UserSource(FakeClient()),
  );
  getIt.registerLazySingleton<PharmacySourceInterface>(
    () => PharmacySource(FakeClient()),
  );
  getIt.registerLazySingleton<CategoryRepositoryInterface>(
    () => CategoryRepository(getIt<PharmacySourceInterface>()),
  );
  getIt.registerLazySingleton<MedicineRepositoryInterface>(
    () => MedicineRepository(getIt<PharmacySourceInterface>()),
  );
  getIt.registerLazySingleton<UserRepositoryInterface>(
    () => UserRepository(getIt<UserSourceInterface>()),
  );
}
