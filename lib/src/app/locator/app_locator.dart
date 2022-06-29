import 'package:dro_health/src/data/data.dart';
import 'package:dro_health/src/utils/fake/client.dart';
import 'package:get_it/get_it.dart';

GetIt _getIt = GetIt.I;

final locator = _getIt;

void setupLocator() {
  _getIt.registerLazySingleton<UserSourceInterface>(
    () => UserSource(FakeClient()),
  );
  _getIt.registerLazySingleton<PharmacySourceInterface>(
    () => PharmacySource(FakeClient()),
  );
  _getIt.registerLazySingleton<CategoryRepositoryInterface>(
    () => CategoryRepository(_getIt<PharmacySourceInterface>()),
  );
  _getIt.registerLazySingleton<MedicineRepositoryInterface>(
    () => MedicineRepository(_getIt<PharmacySourceInterface>()),
  );
  _getIt.registerLazySingleton<UserRepositoryInterface>(
    () => UserRepository(_getIt<UserSourceInterface>()),
  );
}
