import 'dart:convert';
import 'dart:developer';

import 'package:dd3_main_dependencies/dd3_main_dependencies.dart';

class HttpDD3 extends HttpInteface {
  HttpDD3({
    required Client client,
    required DD3Cryto dd3crypto,
    required String baseUrl,
    required String publicKey,
  })  : _inner = client,
        _baseUrl = baseUrl,
        _publicKey = publicKey,
        _dd3crypto = dd3crypto;
  final String _publicKey;
  final String _baseUrl;
  final Client _inner;
  final DD3Cryto _dd3crypto;

  @override
  Future<HttpResult> get(String endpoint) async {
    final url = _buildUrl(endpoint);
    final response = await _inner.get(Uri.parse(url));
    final responseBody = _decodeResponseBody(response.body);
    if (response.statusCode == 200) {
      log(responseBody['data'].toString());
      final data = Model.fromJson(responseBody['data']);
      return HttpResult.ok(data);
    } else {
      final errorCode = response.statusCode;
      final errorMessage = response.reasonPhrase ?? 'Unknown error';
      return HttpResult.err(errorMessage, errorCode);
    }
  }

  @override
  Future<HttpResult> post(String endpoint, {dynamic body}) async {
    final url = _buildUrl(endpoint);
    final response = await _inner.post(Uri.parse(url), body: body);
    final responseBody = _decodeResponseBody(response.body);
    if (response.statusCode == 200) {
      final data = Model.fromJson(responseBody['data']);
      return HttpResult.ok(data);
    } else {
      final error = response.statusCode.toString();
      return HttpResult.err(error);
    }
  }

  @override
  Future<HttpResult> put(String endpoint, {dynamic body}) async {
    final url = _buildUrl(endpoint);
    final response = await _inner.put(Uri.parse(url), body: body);
    final responseBody = _decodeResponseBody(response.body);
    if (response.statusCode == 200) {
      final data = Model.fromJson(responseBody['data']);
      return HttpResult.ok(data);
    } else {
      final errorCode = response.statusCode;
      final errorMessage = response.reasonPhrase;
      return HttpResult.err(errorMessage ?? '', errorCode);
    }
  }

  String _buildUrl(String endpoint) =>
      '$_baseUrl$endpoint&ts=${_dd3crypto.publicTimestamp}&apikey=$_publicKey&hash=${_dd3crypto.hash}';

  Map<String, dynamic> _decodeResponseBody(String responseBody) {
    final jsonData = json.decode(responseBody);
    return jsonData;
  }

  @override
  String toString() {
    return 'HttpDD3(_publicKey: $_publicKey, _baseUrl: $_baseUrl, _inner: $_inner, _dd3crypto: $_dd3crypto)';
  }
}
