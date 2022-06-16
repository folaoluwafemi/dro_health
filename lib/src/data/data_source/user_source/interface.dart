import 'package:dro_health/src/models/models.dart';

abstract class UserSourceInterface {
  Future<User> getUser();
}