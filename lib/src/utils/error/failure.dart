import 'dart:async';
import 'dart:developer' as dev;

class Failure {
  final String message;
  final StackTrace stackTrace;

  Failure(this.message, [StackTrace? stackTrace])
      : stackTrace = stackTrace ?? StackTrace.current;

  @override
  String toString() {
    return '$message\n$stackTrace';
  }
}

mixin ErrorHandler {
  FutureOr<T> simpleErrorHandler<T>({
    required Function computation,
  }) async {
    try {
      return await computation();
    } catch (e) {
      dev.log('$e');
      throw Failure(e.toString());
    }
  }
}
