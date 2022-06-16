import 'dart:convert';
import 'dart:developer' as dev;
import 'dart:typed_data';

import 'package:dro_health/src/utils/fake/fake.dart';
import 'package:http/http.dart';

abstract class FakeClientInterface extends Fake implements Client {
  @override
  void close() {
    dev.log('close called');
  }

  @override
  Future<Response> delete(
    Uri url, {
    Map<String, String>? headers,
    Object? body,
    Encoding? encoding,
  }) {
    return Future.value(Response('', 404));
  }

  @override
  Future<Response> get(
    Uri url, {
    Map<String, String>? headers,
  }) {
    ///todo implement get
    return Future.value(Response('', 404));
  }

  @override
  Future<Response> head(
    Uri url, {
    Map<String, String>? headers,
  }) {
    return Future.value(Response('', 404));
  }

  @override
  Future<Response> patch(
    Uri url, {
    Map<String, String>? headers,
    Object? body,
    Encoding? encoding,
  }) {
    return Future.value(Response('', 404));
  }

  @override
  Future<Response> post(
    Uri url, {
    Map<String, String>? headers,
    Object? body,
    Encoding? encoding,
  }) {
    return Future.value(Response('', 404));
  }

  @override
  Future<Response> put(
    Uri url, {
    Map<String, String>? headers,
    Object? body,
    Encoding? encoding,
  }) {
    return Future.value(Response('', 404));
  }

  @override
  Future<String> read(
    Uri url, {
    Map<String, String>? headers,
  }) {
    return Future.value('');
  }

  @override
  Future<Uint8List> readBytes(
    Uri url, {
    Map<String, String>? headers,
  }) {
    return Future.value(Uint8List(0));
  }

  @override
  Future<StreamedResponse> send(BaseRequest request) {
    // TODO: implement send
    throw UnimplementedError();
  }
}
