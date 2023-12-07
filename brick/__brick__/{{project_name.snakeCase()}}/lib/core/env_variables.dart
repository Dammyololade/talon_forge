import 'package:flutter_dotenv/flutter_dotenv.dart';

class EnvVars {
  EnvVars._();

  static String get baseUrl => dotenv.env['baseUrl']!;
}