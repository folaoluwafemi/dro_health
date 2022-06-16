import 'package:dro_health/src/models/models.dart';

abstract class UserRepositoryInterface {
  Future<User> getUser();
}
