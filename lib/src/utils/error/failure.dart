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
