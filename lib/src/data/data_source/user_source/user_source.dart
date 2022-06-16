import 'package:dro_health/src/data/data_source/user_source/interface.dart';
import 'package:dro_health/src/models/user/user.dart';

class UserSource implements UserSourceInterface {
  @override
  Future<User> get() async {
    throw UnimplementedError();
  }

  @override
  Future<void> post(User user) async {
  }
}
