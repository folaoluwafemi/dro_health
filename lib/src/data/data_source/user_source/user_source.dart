import 'dart:convert';
import 'dart:developer' as dev;

import 'package:dro_health/src/data/data_source/user_source/interface.dart';
import 'package:dro_health/src/models/models.dart';
import 'package:dro_health/src/utils/constants/constants.dart';
import 'package:dro_health/src/utils/error/failure.dart';
import 'package:http/http.dart';

class UserSource implements UserSourceInterface {
  final Client client;

  UserSource(this.client);

  @override
  Future<User> getUser() async {
    Map<String, dynamic> rawUser = await _tryRequest();
    User newUser = UserFactory.fromMap(rawUser);
    return newUser;
  }

  Future<Map<String, dynamic>> _tryRequest() async {
    try {
      return _makeRequest();
    } catch (e) {
      dev.log('$e');
      return Future.error(e, StackTrace.current);
    }
  }

  Future<Map<String, dynamic>> _makeRequest() async {
    Response response = await client.get(Urls.fakeUserUrl);
    if (response.statusCode != 200) {
      throw Failure('an error occurred');
    }
    Map<String, dynamic> rawData = jsonDecode(response.body);
    return rawData;
  }
}
