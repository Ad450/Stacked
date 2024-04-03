class ApiFailure {
  final String message;
  final Object? stackTrace;

  ApiFailure(this.message, {this.stackTrace});
}

class UIError {
  final String message;
  const UIError._(this.message);

  factory UIError.fromApiFailure(ApiFailure apiFailure) {
    return UIError._(apiFailure.message);
  }
}
