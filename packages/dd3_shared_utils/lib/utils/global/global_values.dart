import 'package:dd3_main_dependencies/dd3_main_dependencies.dart';

class GlobalValues {
  static String baseUrl = 'https://gateway.marvel.com:443';
  static String publicKey = dotenv.env['PUBLIC_API_KEY'] ?? '';
  static String privateKey = dotenv.env['PRIVATE_API_KEY'] ?? '';
}
