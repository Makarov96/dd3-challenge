import 'package:dd3_http/http_services/model_http.dart';

class HttpResult {
  final Model data;
  final int statusCode;
  final String? errorMessage;

  HttpResult(
    this.data,
    this.statusCode, {
    this.errorMessage,
  });

  factory HttpResult.ok(Model data) {
    return HttpResult(data, 200);
  }

  factory HttpResult.err(
    String errorMessage, [
    int statusCode = 500,
  ]) {
    return HttpResult(
      Model.empty(),
      statusCode,
      errorMessage: errorMessage,
    );
  }

  T unwrap<T>() {
    return data as T;
  }

  T when<T>({
    required T Function(Model data) ok,
    required T Function(
      String errorMessage,
      int statusCode,
    ) err,
  }) {
    if (statusCode == 200) {
      return ok(data);
    } else {
      return err(errorMessage!, statusCode);
    }
  }
}
