import 'package:flutter_dotenv/flutter_dotenv.dart';

extension EnvExtension on String {
  String get env => dotenv.env[this] ?? '';
}