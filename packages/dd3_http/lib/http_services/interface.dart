import 'package:dd3_http/http_services/http_result.dart';

abstract class HttpInteface {
  Future<HttpResult> get(String endpoint);

  Future<HttpResult> post(String endpoint, {dynamic body});

  Future<HttpResult> put(String endpoint, {dynamic body});
}
