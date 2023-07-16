import 'dart:convert';
import 'package:dd3_main_dependencies/dd3_main_dependencies.dart';

abstract class DD3Cryto {
  String get hash;
  String get publicTimestamp;
  String get _timestamp {
    DateTime now = DateTime.now();
    int timestamp = now.millisecondsSinceEpoch ~/ 1000;
    return timestamp.toString();
  }

  String _calculateMD5(String input) {
    var bytes = utf8.encode(input);
    var md5Hash = md5.convert(bytes);
    return md5Hash.toString();
  }
}

class DD3Hash extends DD3Cryto {
  @override
  String get hash {
    String publicKey = GlobalValues.publicKey;
    String privateKey = GlobalValues.privateKey;
    String timestamp = _timestamp;
    String input = timestamp + privateKey + publicKey;
    String md5Hash = _calculateMD5(input);
    return md5Hash;
  }

  @override
  String get publicTimestamp => _timestamp;
}
