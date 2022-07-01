import 'package:dro_health/src/data/data_barrel.dart';
import 'package:dro_health/src/models/user/user.dart';

class UserRepository implements UserRepositoryInterface {
  final UserSourceInterface dataSource;

  UserRepository(this.dataSource);

  @override
  Future<User> getUser() async {
    return await dataSource.getUser();
  }
}
